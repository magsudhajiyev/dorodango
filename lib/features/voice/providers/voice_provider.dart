import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/stage_content.dart';
import '../../../core/constants/voice_commands.dart';
import '../../../data/models/chat_message.dart';
import '../../../data/models/voice_state.dart';
import '../../guided_build/providers/build_session_provider.dart';
import '../../guided_build/providers/credits_provider.dart';
import '../services/ai_chat_service.dart';
import '../services/command_parser.dart';
import '../services/voice_phrases.dart';
import '../services/stt_service.dart';
import '../services/tts_service.dart';

final sttServiceProvider = Provider((ref) => SttService());
final ttsServiceProvider = Provider((ref) => TtsService());
final commandParserProvider = Provider((ref) => CommandParser());

final voiceControllerProvider = Provider((ref) {
  return VoiceController(
    stt: ref.watch(sttServiceProvider),
    tts: ref.watch(ttsServiceProvider),
    parser: ref.watch(commandParserProvider),
    chatService: ref.watch(aiChatServiceProvider),
    buildSession: ref.read(buildSessionProvider.notifier),
    getBuildState: () => ref.read(buildSessionProvider),
    creditsNotifier: ref.read(creditsProvider.notifier),
  );
});

/// Stream of conversation messages for the UI.
final conversationProvider =
    StateProvider<List<ChatMessage>>((ref) => []);

/// Whether the hands-free conversation loop is active.
final conversationModeProvider = StateProvider<bool>((ref) => false);

/// Whether the "Hey Doro" wake word is listening.
final wakeWordProvider = StateProvider<bool>((ref) => false);

class VoiceController {
  final SttService stt;
  final TtsService tts;
  final CommandParser parser;
  final AiChatService chatService;
  final BuildSessionNotifier buildSession;
  final BuildSessionState Function() getBuildState;
  final CreditsNotifier creditsNotifier;

  AppLocalizations? _l10n;
  StageContent? _stageContent;

  /// In-memory conversation history (ephemeral, per session).
  final List<ChatMessage> _conversationHistory = [];

  /// Callback to update the conversation provider from outside.
  void Function(List<ChatMessage>)? onConversationChanged;

  /// Hands-free conversation loop: after each spoken answer the mic
  /// automatically reopens for the next turn, until the user says a stop
  /// phrase, stays silent, or taps the orb.
  bool _conversationMode = false;
  bool _gotResultThisTurn = false;
  bool _handlingInput = false;
  int _listenRetries = 0;
  Timer? _silenceExitTimer;

  /// Callback to update the conversation-mode provider from outside.
  void Function(bool active)? onConversationModeChanged;


  VoiceController({
    required this.stt,
    required this.tts,
    required this.parser,
    required this.chatService,
    required this.buildSession,
    required this.getBuildState,
    required this.creditsNotifier,
  });

  List<ChatMessage> get conversationHistory =>
      List.unmodifiable(_conversationHistory);

  String _languageCode = 'en';

  void updateLocale(String languageCode, AppLocalizations l10n) {
    // The full voice loop follows the app language: recognition, command
    // patterns, wake/stop phrases, spoken responses, and the AI's replies.
    _languageCode = voiceSupportedLanguages.contains(languageCode)
        ? languageCode
        : 'en';
    if (_languageCode == languageCode) {
      _l10n = l10n;
      _stageContent = StageContent(l10n);
    } else {
      final enL10n = lookupAppLocalizations(const Locale('en'));
      _l10n = enL10n;
      _stageContent = StageContent(enL10n);
    }
    tts.setLocale(_languageCode);
    stt.setLocale(_languageCode);
    parser.setLocale(_languageCode);
  }

  /// Wake-word ("Hey Doro") passive listening: while enabled and nothing
  /// else is using the mic, a low-key recognition loop runs and starts the
  /// conversation when the wake phrase is heard.
  bool _wakeWordEnabled = false;
  bool _passiveActive = false;
  int _passiveErrorStreak = 0;
  Timer? _passiveRestartTimer;

  /// Callback to update the wake-word provider from outside.
  void Function(bool enabled)? onWakeWordChanged;


  /// Starts the hands-free conversation loop.
  Future<void> startConversation() async {
    _passiveRestartTimer?.cancel();
    if (_passiveActive) {
      _passiveActive = false;
      await stt.cancel();
    }
    _setConversationMode(true);
    stt.onStatus = _handleSttStatus;
    stt.onError = _handleSttError;
    await startListening();
  }

  /// Enables/disables the "Hey Doro" wake word.
  Future<void> setWakeWordEnabled(bool enabled) async {
    if (_wakeWordEnabled == enabled) return;
    _wakeWordEnabled = enabled;
    _passiveErrorStreak = 0;
    onWakeWordChanged?.call(enabled);
    debugPrint('[Voice] wake word ${enabled ? 'on' : 'off'}');
    if (enabled) {
      stt.onStatus = _handleSttStatus;
      stt.onError = _handleSttError;
      await _startPassiveListen();
    } else {
      _passiveRestartTimer?.cancel();
      if (_passiveActive) {
        _passiveActive = false;
        await stt.cancel();
      }
    }
  }

  Future<void> _startPassiveListen() async {
    if (!_wakeWordEnabled || _conversationMode || _passiveActive) return;
    if (getBuildState().voiceState != VoiceState.idle) {
      _schedulePassiveRestart();
      return;
    }
    _passiveActive = true;
    final started = await stt.startListening(
      // Dictation mode + long windows: the session survives silence for
      // minutes instead of seconds, so Android's start-of-listening chime
      // fires rarely instead of every few seconds.
      dictation: true,
      pauseFor: const Duration(seconds: 60),
      listenFor: const Duration(minutes: 5),
      onResult: (text, isFinal) {
        if (!_passiveActive) return;
        if (_containsWakePhrase(text)) {
          _onWakeDetected();
        }
      },
    );
    if (!started) {
      _passiveActive = false;
    }
  }

  bool _containsWakePhrase(String text) {
    final normalized =
        text.toLowerCase().replaceAll(RegExp(r'[.,!?、。！？]'), '');
    return wakePhrasesFor(_languageCode).any(normalized.contains);
  }

  Future<void> _onWakeDetected() async {
    debugPrint('[Voice] wake phrase detected');
    _passiveErrorStreak = 0;
    _passiveActive = false;
    _passiveRestartTimer?.cancel();
    await stt.cancel();
    _setConversationMode(true);
    await _speak(_l10n?.wakeAck ?? 'Yes?');
    await startListening();
  }

  void _schedulePassiveRestart(
      {Duration delay = const Duration(milliseconds: 600)}) {
    if (!_wakeWordEnabled) return;
    _passiveRestartTimer?.cancel();
    _passiveRestartTimer = Timer(delay, () {
      if (_wakeWordEnabled &&
          !_conversationMode &&
          !_passiveActive &&
          getBuildState().voiceState == VoiceState.idle &&
          !stt.isListening) {
        _startPassiveListen();
      } else if (_wakeWordEnabled && !_passiveActive) {
        // Something is still using the mic or speaking — try again later.
        _schedulePassiveRestart();
      }
    });
  }

  /// Stops TTS mid-sentence so the user can talk over the assistant.
  /// The conversation loop reopens the mic on its own afterwards.
  Future<void> interrupt() async {
    await tts.stop();
  }

  /// Tears the whole voice surface down (wake word, conversation, mic,
  /// speech). Called when the user leaves the build screen so no callback
  /// fires into a disposed widget tree.
  Future<void> shutdown() async {
    _wakeWordEnabled = false;
    _passiveActive = false;
    _conversationMode = false;
    _passiveRestartTimer?.cancel();
    _silenceExitTimer?.cancel();
    onConversationChanged = null;
    onConversationModeChanged = null;
    onWakeWordChanged = null;
    await stt.cancel();
    await tts.stop();
    buildSession.setVoiceState(VoiceState.idle);
  }

  Future<void> startListening() async {
    _gotResultThisTurn = false;
    _silenceExitTimer?.cancel();
    buildSession.setVoiceState(VoiceState.listening);

    final started = await stt.startListening(
      onResult: (text, isFinal) {
        if (isFinal) {
          _silenceExitTimer?.cancel();
          _gotResultThisTurn = text.trim().isNotEmpty;
          _handleInput(text);
        }
      },
    );
    if (!started) {
      // Don't show a pulsing mic that isn't actually recording. The error
      // handler may still recover the conversation with a retry.
      debugPrint('[Voice] listen did not start');
    }
  }

  Future<void> stopListening() async {
    _setConversationMode(false);
    await stt.stopListening();
    buildSession.setVoiceState(VoiceState.idle);
    _schedulePassiveRestart();
  }

  void _setConversationMode(bool active) {
    if (_conversationMode == active) return;
    _conversationMode = active;
    if (!active) {
      _silenceExitTimer?.cancel();
      _schedulePassiveRestart();
    }
    onConversationModeChanged?.call(active);
  }

  void _endConversationQuietly() {
    _setConversationMode(false);
    if (getBuildState().voiceState == VoiceState.listening) {
      buildSession.setVoiceState(VoiceState.idle);
    }
  }

  void _handleSttStatus(String status) {
    // Passive wake-word session ended (silence window or platform cap):
    // just spin it up again.
    if (_passiveActive) {
      if (status == 'done' || status == 'notListening') {
        _passiveActive = false;
        _schedulePassiveRestart();
      }
      return;
    }
    if (!_conversationMode) return;
    // The platform stopped listening. On Android the 'done' status often
    // arrives BEFORE the final result is delivered, so don't end the loop
    // immediately — give the result a grace period. If nothing arrives,
    // the turn was silence and the user is done talking.
    if (status == 'done' || status == 'notListening') {
      _silenceExitTimer?.cancel();
      _silenceExitTimer = Timer(const Duration(milliseconds: 1500), () {
        if (_conversationMode &&
            !_gotResultThisTurn &&
            !_handlingInput &&
            !stt.isListening &&
            getBuildState().voiceState == VoiceState.listening) {
          _endConversationQuietly();
        }
      });
    }
  }

  void _handleSttError(String errorMsg) {
    if (_passiveActive) {
      _passiveActive = false;
      if (errorMsg.contains('no_match') ||
          errorMsg.contains('speech_timeout')) {
        // Nothing was said — routine for a wake-word loop. Cool down
        // before reopening so the chime stays infrequent.
        _schedulePassiveRestart(delay: const Duration(seconds: 3));
        return;
      }
      _passiveErrorStreak++;
      if (_passiveErrorStreak > 4) {
        // The recognizer keeps refusing — stop draining the battery.
        debugPrint('[Voice] disabling wake word after repeated errors');
        setWakeWordEnabled(false);
      } else {
        _schedulePassiveRestart(delay: const Duration(seconds: 1));
      }
      return;
    }
    if (!_conversationMode) return;
    if (getBuildState().voiceState != VoiceState.listening) return;

    if (errorMsg.contains('no_match') || errorMsg.contains('speech_timeout')) {
      // Heard nothing this turn — treat as silence.
      debugPrint('[Voice] silence error -> ending conversation');
      _endConversationQuietly();
      return;
    }
    // Recognizers (especially Android) often refuse to restart right after
    // TTS releases the audio session — cancel the stale session and retry
    // before giving up.
    if (_listenRetries < 3) {
      _listenRetries++;
      debugPrint('[Voice] listen retry $_listenRetries after "$errorMsg"');
      Future<void>.delayed(const Duration(milliseconds: 700), () async {
        if (_conversationMode &&
            getBuildState().voiceState == VoiceState.listening) {
          await stt.cancel();
          await startListening();
        }
      });
    } else {
      debugPrint('[Voice] giving up after "$errorMsg"');
      _endConversationQuietly();
    }
  }

  String _normalizePhrase(String text) => text
      .toLowerCase()
      .replaceAll(RegExp(r"[.,!?、。！？'’\s]"), '');

  bool _isStopPhrase(String text) {
    final normalized = _normalizePhrase(text);
    return stopPhrasesFor(_languageCode)
        .any((phrase) => _normalizePhrase(phrase) == normalized);
  }

  /// Reopens the mic for the next turn while the conversation loop is on.
  /// The delay gives the platform audio session time to switch from TTS
  /// playback back to recording.
  Future<void> _resumeConversation() async {
    if (!_conversationMode) return;
    if (getBuildState().voiceState != VoiceState.idle) return;
    if (stt.isListening) return;
    debugPrint('[Voice] resuming conversation turn');
    await Future<void>.delayed(const Duration(milliseconds: 450));
    if (_conversationMode && !stt.isListening) await startListening();
  }

  Future<void> speakCurrentStage() async {
    final state = getBuildState();
    final content = _stageContent?.getInstruction(state.currentStage);
    if (content != null) {
      await _speak(content.voiceReadout);
    }
  }

  /// Main input handler — known commands are handled locally (fast and
  /// free); everything else goes to the AI coach when credits remain.
  Future<void> _handleInput(String rawText) async {
    // Some platforms deliver the final result more than once per turn.
    if (_handlingInput) return;
    _handlingInput = true;

    try {
      await stt.stopListening();

      final text = rawText.trim();
      if (text.isEmpty) {
        // Silence — leave the conversation quietly.
        _endConversationQuietly();
        buildSession.setVoiceState(VoiceState.idle);
        return;
      }
      _listenRetries = 0;

      if (_conversationMode && _isStopPhrase(text)) {
        _setConversationMode(false);
        await _speak(_l10n?.voiceGoodbye ??
            'Happy polishing. Tap the orb when you need me again.');
        return;
      }

      // Commands are short imperatives ("next", "repeat that"). The parser
      // matches by substring, so only consult it for brief utterances —
      // otherwise a real question like "...can you help me" gets hijacked
      // by the canned 'help' response instead of reaching the AI coach.
      final isShortUtterance =
          text.split(RegExp(r'\s+')).length <= 5;
      final command =
          isShortUtterance ? parser.parse(text) : VoiceCommand.unknown;
      if (command != VoiceCommand.unknown) {
        await _handleCommand(text);
      } else {
        // Anything that isn't a known command goes to the AI coach. The
        // server enforces credits — don't gate on the locally cached
        // balance, which can be stale (e.g. fetch hasn't landed yet).
        await _handleAiMessage(text);
      }
    } finally {
      _handlingInput = false;
    }

    await _resumeConversation();
  }

  /// AI conversation path — sends to Cloud Function.
  Future<void> _handleAiMessage(String rawText) async {
    // Add user message to history
    final userMessage = ChatMessage(
      role: 'user',
      content: rawText,
      timestamp: DateTime.now(),
    );
    _addMessage(userMessage);

    // Set processing state
    buildSession.setVoiceState(VoiceState.processing);

    try {
      final state = getBuildState();
      final buildId = state.activeBuildId;
      if (buildId == null) {
        await _handleCommand(rawText);
        return;
      }

      // Send to Cloud Function (excluding the user message we just added,
      // since it's passed as the `message` parameter)
      final history = _conversationHistory
          .where((m) => m != userMessage)
          .toList();

      final result = await chatService.sendMessage(
        message: rawText,
        buildId: buildId,
        conversationHistory: history,
        languageCode: _languageCode,
      );

      // Update credits
      creditsNotifier.set(result.creditsRemaining);

      // Add assistant response to history
      final assistantMessage = ChatMessage(
        role: 'assistant',
        content: result.message,
        timestamp: DateTime.now(),
      );
      _addMessage(assistantMessage);

      // Speak the response
      await _speak(result.message);
    } on FirebaseFunctionsException catch (e) {
      // Don't keep the hands-free loop running into repeated failures.
      _setConversationMode(false);
      if (e.code == 'resource-exhausted') {
        creditsNotifier.set(0);
        final message = _l10n?.voiceOutOfCredits ??
            "You're out of AI credits. I can still respond to commands "
                'like next, repeat, and help.';
        _addMessage(ChatMessage(
          role: 'assistant',
          content: message,
          timestamp: DateTime.now(),
        ));
        // Muddy hands: the user must HEAR why the coach went quiet.
        await _speak(message);
      } else {
        final message = _l10n?.voiceError ??
            'Something went wrong. Tap the orb to try again.';
        _addMessage(ChatMessage(
          role: 'assistant',
          content: message,
          timestamp: DateTime.now(),
        ));
        await _speak(message);
      }
    } catch (_) {
      _setConversationMode(false);
      final message = _l10n?.voiceConnectionLost ??
          'I lost the connection. Check your internet and tap the orb.';
      _addMessage(ChatMessage(
        role: 'assistant',
        content: message,
        timestamp: DateTime.now(),
      ));
      await _speak(message);
    }
  }

  /// Command parser fallback (free, no AI).
  Future<void> _handleCommand(String rawText) async {
    final command = parser.parse(rawText);
    final state = getBuildState();
    final stage = state.currentStage;

    String responseText;

    switch (command) {
      case VoiceCommand.next:
        if (stage.isTerminal) {
          responseText =
              _l10n?.alreadyComplete ?? 'Your dorodango is already complete!';
        } else {
          await buildSession.advanceToNextStage();
          final newState = getBuildState();
          final newInstruction =
              _stageContent?.getInstruction(newState.currentStage);
          responseText = newInstruction?.voiceReadout ?? '';
        }
      case VoiceCommand.repeat:
        final instruction = _stageContent?.getInstruction(stage);
        responseText = instruction?.voiceReadout ?? '';
      case VoiceCommand.help:
        responseText = _stageContent?.helpResponse(stage) ?? '';
      case VoiceCommand.diagnose:
        responseText = _stageContent?.diagnoseStubResponse() ?? '';
      case VoiceCommand.howLongToDry:
        responseText = _stageContent?.dryingTimeResponse(stage) ?? '';
      case VoiceCommand.whatWentWrong:
        responseText = _stageContent?.whatWentWrongResponse(stage) ?? '';
      case VoiceCommand.unknown:
        responseText = _l10n?.voiceUnknownCommand ??
            "I didn't understand that. Try saying next, repeat, help, or what went wrong.";
    }

    await _speak(responseText);
  }

  Future<void> _speak(String text) async {
    buildSession.setVoiceState(VoiceState.speaking);
    await tts.speak(text);
    buildSession.setVoiceState(VoiceState.idle);
  }

  void _addMessage(ChatMessage message) {
    _conversationHistory.add(message);
    onConversationChanged?.call(List.unmodifiable(_conversationHistory));
  }

  void clearConversation() {
    _conversationHistory.clear();
    onConversationChanged?.call(const []);
  }
}

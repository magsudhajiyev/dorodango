import 'dart:async';
import 'dart:ui';
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
    getCredits: () => ref.read(creditsProvider),
  );
});

/// Stream of conversation messages for the UI.
final conversationProvider =
    StateProvider<List<ChatMessage>>((ref) => []);

/// Whether the hands-free conversation loop is active.
final conversationModeProvider = StateProvider<bool>((ref) => false);

class VoiceController {
  final SttService stt;
  final TtsService tts;
  final CommandParser parser;
  final AiChatService chatService;
  final BuildSessionNotifier buildSession;
  final BuildSessionState Function() getBuildState;
  final CreditsNotifier creditsNotifier;
  final int Function() getCredits;

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

  /// Voice is English-only for now (see [updateLocale]).
  static const Set<String> _stopPhrases = {
    'stop',
    'stop listening',
    "that's all",
    'thats all',
    'that is all',
    'goodbye',
    'bye',
    'exit',
    'quit',
    'end conversation',
    "i'm done",
    'im done',
    'done',
    'no thanks',
    'nothing else',
  };

  VoiceController({
    required this.stt,
    required this.tts,
    required this.parser,
    required this.chatService,
    required this.buildSession,
    required this.getBuildState,
    required this.creditsNotifier,
    required this.getCredits,
  });

  List<ChatMessage> get conversationHistory =>
      List.unmodifiable(_conversationHistory);

  void updateLocale(String languageCode, AppLocalizations l10n) {
    // Voice feature is English-only for now (TTS quality varies by locale)
    final enL10n = lookupAppLocalizations(const Locale('en'));
    _l10n = enL10n;
    _stageContent = StageContent(enL10n);
    tts.setLocale('en');
    stt.setLocale('en');
    parser.setLocale('en');
  }

  /// Starts the hands-free conversation loop.
  Future<void> startConversation() async {
    _setConversationMode(true);
    stt.onStatus = _handleSttStatus;
    stt.onError = _handleSttError;
    await startListening();
  }

  /// Stops TTS mid-sentence so the user can talk over the assistant.
  /// The conversation loop reopens the mic on its own afterwards.
  Future<void> interrupt() async {
    await tts.stop();
  }

  Future<void> startListening() async {
    _gotResultThisTurn = false;
    _silenceExitTimer?.cancel();
    buildSession.setVoiceState(VoiceState.listening);

    await stt.startListening(
      onResult: (text, isFinal) {
        if (isFinal) {
          _silenceExitTimer?.cancel();
          _gotResultThisTurn = text.trim().isNotEmpty;
          _handleInput(text);
        }
      },
    );
  }

  Future<void> stopListening() async {
    _setConversationMode(false);
    await stt.stopListening();
    buildSession.setVoiceState(VoiceState.idle);
  }

  void _setConversationMode(bool active) {
    if (_conversationMode == active) return;
    _conversationMode = active;
    if (!active) _silenceExitTimer?.cancel();
    onConversationModeChanged?.call(active);
  }

  void _endConversationQuietly() {
    _setConversationMode(false);
    if (getBuildState().voiceState == VoiceState.listening) {
      buildSession.setVoiceState(VoiceState.idle);
    }
  }

  void _handleSttStatus(String status) {
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
    if (!_conversationMode) return;
    if (getBuildState().voiceState != VoiceState.listening) return;

    if (errorMsg.contains('no_match') || errorMsg.contains('speech_timeout')) {
      // Heard nothing this turn — treat as silence.
      _endConversationQuietly();
      return;
    }
    // Recognizers (especially Android) often refuse to restart right after
    // TTS releases the audio session — retry once before giving up.
    if (_listenRetries < 2) {
      _listenRetries++;
      Future<void>.delayed(const Duration(milliseconds: 600), () {
        if (_conversationMode &&
            getBuildState().voiceState == VoiceState.listening) {
          startListening();
        }
      });
    } else {
      _endConversationQuietly();
    }
  }

  bool _isStopPhrase(String text) {
    final normalized = text
        .toLowerCase()
        .replaceAll(RegExp(r'[.,!?]'), '')
        .trim();
    return _stopPhrases.contains(normalized);
  }

  /// Reopens the mic for the next turn while the conversation loop is on.
  /// The delay gives the platform audio session time to switch from TTS
  /// playback back to recording.
  Future<void> _resumeConversation() async {
    if (!_conversationMode) return;
    if (getBuildState().voiceState != VoiceState.idle) return;
    if (stt.isListening) return;
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

      final command = parser.parse(text);
      if (command != VoiceCommand.unknown) {
        await _handleCommand(text);
      } else if (getCredits() > 0) {
        await _handleAiMessage(text);
      } else {
        await _handleCommand(text);
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
        // Out of credits — add system message, fall back
        _addMessage(ChatMessage(
          role: 'assistant',
          content: 'Out of credits. Switching to basic commands.',
          timestamp: DateTime.now(),
        ));
        creditsNotifier.set(0);
        buildSession.setVoiceState(VoiceState.idle);
      } else {
        // Other error
        _addMessage(ChatMessage(
          role: 'assistant',
          content: 'Something went wrong. Tap to try again.',
          timestamp: DateTime.now(),
        ));
        buildSession.setVoiceState(VoiceState.idle);
      }
    } catch (_) {
      _setConversationMode(false);
      _addMessage(ChatMessage(
        role: 'assistant',
        content: 'Connection timed out. Check internet.',
        timestamp: DateTime.now(),
      ));
      buildSession.setVoiceState(VoiceState.idle);
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

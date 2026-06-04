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

  Future<void> startListening() async {
    buildSession.setVoiceState(VoiceState.listening);

    await stt.startListening(
      onResult: (text, isFinal) {
        if (isFinal) {
          _handleInput(text);
        }
      },
    );
  }

  Future<void> stopListening() async {
    await stt.stopListening();
    buildSession.setVoiceState(VoiceState.idle);
  }

  Future<void> speakCurrentStage() async {
    final state = getBuildState();
    final content = _stageContent?.getInstruction(state.currentStage);
    if (content != null) {
      await _speak(content.voiceReadout);
    }
  }

  /// Main input handler — routes to AI or command parser based on credits.
  Future<void> _handleInput(String rawText) async {
    await stt.stopListening();

    final credits = getCredits();

    if (credits > 0) {
      await _handleAiMessage(rawText);
    } else {
      await _handleCommand(rawText);
    }
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

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../voice/services/ai_chat_service.dart';
import 'credits_provider.dart';

enum DiagnosisStatus { idle, loading, success, error }

class DiagnosisState {
  final DiagnosisStatus status;
  final String? diagnosis;
  final String? error;

  const DiagnosisState({
    this.status = DiagnosisStatus.idle,
    this.diagnosis,
    this.error,
  });

  DiagnosisState copyWith({
    DiagnosisStatus? status,
    String? diagnosis,
    String? error,
  }) =>
      DiagnosisState(
        status: status ?? this.status,
        diagnosis: diagnosis ?? this.diagnosis,
        error: error ?? this.error,
      );
}

class DiagnosisNotifier extends StateNotifier<DiagnosisState> {
  final AiChatService _chatService;
  final CreditsNotifier _creditsNotifier;

  DiagnosisNotifier(this._chatService, this._creditsNotifier)
      : super(const DiagnosisState());

  Future<void> diagnose({
    required String buildId,
    required String stageKey,
    required String photoUrl,
  }) async {
    // ignore: avoid_print
    print('[DiagnosisProvider] diagnose called: buildId=$buildId, stageKey=$stageKey, photoUrl=$photoUrl');
    state = const DiagnosisState(status: DiagnosisStatus.loading);
    try {
      final result = await _chatService.diagnosePhoto(
        buildId: buildId,
        stageKey: stageKey,
        photoUrl: photoUrl,
      );
      _creditsNotifier.set(result.creditsRemaining);
      state = DiagnosisState(
        status: DiagnosisStatus.success,
        diagnosis: result.diagnosis,
      );
    } catch (e, st) {
      // ignore: avoid_print
      print('[DiagnosisProvider] Error: $e\n$st');
      state = DiagnosisState(
        status: DiagnosisStatus.error,
        error: e.toString(),
      );
    }
  }

  void reset() {
    state = const DiagnosisState();
  }
}

final diagnosisProvider =
    StateNotifierProvider<DiagnosisNotifier, DiagnosisState>((ref) {
  final chatService = ref.watch(aiChatServiceProvider);
  final creditsNotifier = ref.watch(creditsProvider.notifier);
  return DiagnosisNotifier(chatService, creditsNotifier);
});

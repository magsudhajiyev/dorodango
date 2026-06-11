import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/soil_data.dart';
import '../../guided_build/providers/credits_provider.dart';
import '../../voice/services/ai_chat_service.dart';

enum PredictionStatus { idle, loading, success, error, outOfCredits }

class PredictionState {
  final PredictionStatus status;
  final String? prediction;

  const PredictionState({
    this.status = PredictionStatus.idle,
    this.prediction,
  });
}

class SoilPredictionNotifier extends StateNotifier<PredictionState> {
  final AiChatService _chatService;
  final CreditsNotifier _creditsNotifier;

  SoilPredictionNotifier(this._chatService, this._creditsNotifier)
      : super(const PredictionState());

  Future<void> predict(SoilData soil) async {
    state = const PredictionState(status: PredictionStatus.loading);
    try {
      final result = await _chatService.predictDorodango(
        wrbClass: soil.wrbClass,
        clayPct: soil.clayPct,
        sandPct: soil.sandPct,
        siltPct: soil.siltPct,
      );
      _creditsNotifier.set(result.creditsRemaining);
      state = PredictionState(
        status: PredictionStatus.success,
        prediction: result.prediction,
      );
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'resource-exhausted') {
        _creditsNotifier.set(0);
        state = const PredictionState(status: PredictionStatus.outOfCredits);
      } else {
        state = const PredictionState(status: PredictionStatus.error);
      }
    } catch (_) {
      state = const PredictionState(status: PredictionStatus.error);
    }
  }

  void reset() {
    state = const PredictionState();
  }
}

final soilPredictionProvider = StateNotifierProvider.autoDispose<
    SoilPredictionNotifier, PredictionState>((ref) {
  return SoilPredictionNotifier(
    ref.watch(aiChatServiceProvider),
    ref.watch(creditsProvider.notifier),
  );
});

import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StageTimerState {
  final int elapsedSeconds;
  final bool isRunning;

  const StageTimerState({this.elapsedSeconds = 0, this.isRunning = false});

  String get formatted {
    final h = elapsedSeconds ~/ 3600;
    final m = (elapsedSeconds % 3600) ~/ 60;
    final s = elapsedSeconds % 60;
    if (h > 0) {
      return '${h.toString().padLeft(2, '0')}:'
          '${m.toString().padLeft(2, '0')}:'
          '${s.toString().padLeft(2, '0')}';
    }
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }
}

class StageTimerNotifier extends StateNotifier<StageTimerState> {
  Timer? _timer;

  StageTimerNotifier() : super(const StageTimerState());

  void start() {
    _timer?.cancel();
    state = const StageTimerState(isRunning: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = StageTimerState(
        elapsedSeconds: state.elapsedSeconds + 1,
        isRunning: true,
      );
    });
  }

  void startFrom(int initialSeconds) {
    _timer?.cancel();
    state = StageTimerState(elapsedSeconds: initialSeconds, isRunning: true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = StageTimerState(
        elapsedSeconds: state.elapsedSeconds + 1,
        isRunning: true,
      );
    });
  }

  void stop() {
    _timer?.cancel();
    state = StageTimerState(
      elapsedSeconds: state.elapsedSeconds,
      isRunning: false,
    );
  }

  void reset() {
    _timer?.cancel();
    state = const StageTimerState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final stageTimerProvider =
    StateNotifierProvider<StageTimerNotifier, StageTimerState>((ref) {
  return StageTimerNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/reflection_content.dart';
import '../../../data/models/build_stage.dart';

class ReflectionSessionState {
  final Set<String> shownIds;
  final Reflection? currentReflection;

  const ReflectionSessionState({
    this.shownIds = const {},
    this.currentReflection,
  });

  ReflectionSessionState copyWith({
    Set<String>? shownIds,
    Reflection? Function()? currentReflection,
  }) {
    return ReflectionSessionState(
      shownIds: shownIds ?? this.shownIds,
      currentReflection: currentReflection != null
          ? currentReflection()
          : this.currentReflection,
    );
  }
}

class ReflectionSessionNotifier extends StateNotifier<ReflectionSessionState> {
  ReflectionSessionNotifier() : super(const ReflectionSessionState());

  void surfaceReflection(BuildStage stage) {
    final reflection = ReflectionContent.pickForStage(stage, state.shownIds);
    if (reflection == null) return;
    state = state.copyWith(
      currentReflection: () => reflection,
      shownIds: {...state.shownIds, reflection.id},
    );
  }

  void clearCurrent() {
    state = state.copyWith(currentReflection: () => null);
  }

  void resetSession() {
    state = const ReflectionSessionState();
  }
}

final reflectionSessionProvider = StateNotifierProvider<
    ReflectionSessionNotifier, ReflectionSessionState>(
  (ref) => ReflectionSessionNotifier(),
);

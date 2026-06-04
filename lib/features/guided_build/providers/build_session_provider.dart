import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/build_stage.dart';
import '../../../data/models/voice_state.dart';
import '../../../data/repositories/build_repository.dart';
import '../../../data/services/storage_service.dart';
import '../../auth/providers/auth_provider.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final buildRepositoryProvider = Provider((ref) {
  final firestore = ref.watch(firestoreServiceProvider);
  final storage = ref.watch(storageServiceProvider);
  return BuildRepository(firestore, storage);
});

class BuildSessionState {
  final String? activeBuildId;
  final BuildStage currentStage;
  final VoiceState voiceState;
  final bool isLoading;
  final DateTime? stageEnteredAt;

  const BuildSessionState({
    this.activeBuildId,
    this.currentStage = BuildStage.coreForming,
    this.voiceState = VoiceState.idle,
    this.isLoading = false,
    this.stageEnteredAt,
  });

  bool get hasActiveBuild => activeBuildId != null;

  BuildSessionState copyWith({
    String? activeBuildId,
    BuildStage? currentStage,
    VoiceState? voiceState,
    bool? isLoading,
    DateTime? stageEnteredAt,
  }) =>
      BuildSessionState(
        activeBuildId: activeBuildId ?? this.activeBuildId,
        currentStage: currentStage ?? this.currentStage,
        voiceState: voiceState ?? this.voiceState,
        isLoading: isLoading ?? this.isLoading,
        stageEnteredAt: stageEnteredAt ?? this.stageEnteredAt,
      );
}

class BuildSessionNotifier extends StateNotifier<BuildSessionState> {
  final BuildRepository _buildRepo;
  final String _uid;

  BuildSessionNotifier(this._buildRepo, this._uid)
      : super(const BuildSessionState());

  Future<String> startNewBuild({String? soilSource}) async {
    state = state.copyWith(isLoading: true);
    try {
      final build =
          await _buildRepo.startBuild(_uid, soilSource: soilSource);
      state = state.copyWith(
        activeBuildId: build.id,
        currentStage: BuildStage.coreForming,
        stageEnteredAt: DateTime.now(),
        isLoading: false,
      );
      return build.id;
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> advanceToNextStage({File? photo}) async {
    final buildId = state.activeBuildId;
    if (buildId == null) return;

    final now = DateTime.now();
    final durationSec = state.stageEnteredAt != null
        ? now.difference(state.stageEnteredAt!).inSeconds
        : 0;

    state = state.copyWith(isLoading: true);
    try {
      await _buildRepo.advanceStage(
        uid: _uid,
        buildId: buildId,
        currentStage: state.currentStage,
        durationSec: durationSec,
        photo: photo,
      );

      final nextStage = state.currentStage.next;
      if (nextStage != null) {
        state = state.copyWith(
          currentStage: nextStage,
          stageEnteredAt: DateTime.now(),
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  void setVoiceState(VoiceState vs) {
    state = state.copyWith(voiceState: vs);
  }

  Future<void> resumeBuild(String buildId) async {
    state = state.copyWith(isLoading: true);
    try {
      final stages = await _buildRepo.getStages(_uid, buildId);
      // Active stage: last stage where durationSec is null
      final activeStage = stages.lastWhere(
        (s) => s.durationSec == null,
        orElse: () => stages.last,
      );
      state = BuildSessionState(
        activeBuildId: buildId,
        currentStage: activeStage.stage,
        stageEnteredAt: activeStage.enteredAt,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  void resetSession() {
    state = const BuildSessionState();
  }
}

final buildSessionProvider =
    StateNotifierProvider<BuildSessionNotifier, BuildSessionState>((ref) {
  final buildRepo = ref.watch(buildRepositoryProvider);
  final user = ref.watch(ensureAuthProvider).valueOrNull;
  return BuildSessionNotifier(buildRepo, user?.uid ?? '');
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/build_model.dart';
import '../../../data/models/stage_model.dart';
import '../../auth/providers/auth_provider.dart';
import '../../guided_build/providers/build_session_provider.dart';

final buildListProvider = StreamProvider<List<BuildModel>>((ref) {
  final user = ref.watch(ensureAuthProvider).valueOrNull;
  if (user == null) return Stream.value([]);
  final repo = ref.watch(buildRepositoryProvider);
  return repo.watchBuilds(user.uid);
});

final buildStagesProvider =
    StreamProvider.family<List<StageModel>, String>((ref, buildId) {
  final user = ref.watch(ensureAuthProvider).valueOrNull;
  if (user == null) return Stream.value([]);
  final repo = ref.watch(buildRepositoryProvider);
  return repo.watchStages(user.uid, buildId);
});

final inProgressBuildProvider = Provider<BuildModel?>((ref) {
  final builds = ref.watch(buildListProvider).valueOrNull ?? [];
  return builds.where((b) => b.status == BuildStatus.inProgress).firstOrNull;
});

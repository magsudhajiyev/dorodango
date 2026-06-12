import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/providers/auth_provider.dart';
import '../../build_log/providers/build_log_provider.dart';
import '../../hunt/providers/hunt_provider.dart';

typedef ProfileStats = ({int builds, int planted, int found});

final profileStatsProvider =
    FutureProvider.autoDispose<ProfileStats>((ref) async {
  final uid = ref.watch(authStateProvider).valueOrNull?.uid;
  if (uid == null) return (builds: 0, planted: 0, found: 0);

  final repository = ref.watch(huntRepositoryProvider);
  final builds = ref.watch(buildListProvider).valueOrNull?.length ?? 0;
  final counts = await Future.wait([
    repository.plantedCountBy(uid),
    repository.foundCountBy(uid),
  ]);
  return (builds: builds, planted: counts[0], found: counts[1]);
});

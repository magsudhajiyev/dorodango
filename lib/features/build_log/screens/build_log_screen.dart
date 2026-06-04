import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';
import '../providers/build_log_provider.dart';
import '../widgets/build_log_entry.dart';

class BuildLogScreen extends ConsumerWidget {
  const BuildLogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buildsAsync = ref.watch(buildListProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.buildLog, style: AppTypography.h2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.goNamed(RouteNames.home),
        ),
      ),
      body: buildsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.clay),
        ),
        error: (e, _) => Center(
          child: Text(l10n.error(e.toString()), style: AppTypography.body),
        ),
        data: (builds) {
          if (builds.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle_outlined,
                      size: 64,
                      color: AppColors.inkFaint,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      l10n.noBuildsYet,
                      style: AppTypography.h2,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.startFirstDorodango,
                      style: AppTypography.body
                          .copyWith(color: AppColors.inkSoft),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: builds.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final build = builds[index];
              return BuildLogEntry(
                buildModel: build,
                onTap: () => context.goNamed(
                  RouteNames.buildDetail,
                  pathParameters: {'buildId': build.id},
                ),
              );
            },
          );
        },
      ),
    );
  }
}

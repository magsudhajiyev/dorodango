import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/reflection_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/reflection_provider.dart';

class CompletionReflection extends ConsumerStatefulWidget {
  const CompletionReflection({super.key});

  @override
  ConsumerState<CompletionReflection> createState() =>
      _CompletionReflectionState();
}

class _CompletionReflectionState extends ConsumerState<CompletionReflection> {
  bool _surfaced = false;

  @override
  Widget build(BuildContext context) {
    final reflectionState = ref.watch(reflectionSessionProvider);

    // Surface a completion reflection once
    if (!_surfaced) {
      _surfaced = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final notifier = ref.read(reflectionSessionProvider.notifier);
        final state = ref.read(reflectionSessionProvider);
        if (state.currentReflection == null) {
          final reflection =
              ReflectionContent.pickForCompletion(state.shownIds);
          if (reflection != null) {
            notifier.surfaceReflection(reflection.relevantStages.first);
          }
        }
      });
    }

    final reflection = reflectionState.currentReflection;
    if (reflection == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.mdAll,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top shine gradient edge
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.shine.withValues(alpha: 0.2),
                  AppColors.shine,
                  AppColors.shine.withValues(alpha: 0.2),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  reflection.title(l10n),
                  style: AppTypography.h2,
                ),
                const SizedBox(height: AppSpacing.sm),

                // Full body
                Text(
                  reflection.body(l10n),
                  style: AppTypography.body.copyWith(color: AppColors.inkSoft),
                ),
                const SizedBox(height: AppSpacing.sm),

                // Source
                Text(
                  reflection.source(l10n),
                  style: AppTypography.monoSm.copyWith(
                    color: AppColors.inkFaint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

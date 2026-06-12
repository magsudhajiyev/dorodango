import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_stage.dart';
import '../../guided_build/providers/stage_timer_provider.dart';
import '../providers/reflection_provider.dart';

class ReflectionCard extends ConsumerStatefulWidget {
  final BuildStage stage;

  const ReflectionCard({super.key, required this.stage});

  @override
  ConsumerState<ReflectionCard> createState() => _ReflectionCardState();
}

class _ReflectionCardState extends ConsumerState<ReflectionCard> {
  bool _expanded = false;
  bool _surfaced = false;

  static const _dryingDelaySeconds = 120; // 2 min for drying
  static const _otherDelaySeconds = 60; // 1 min for others

  int get _delaySeconds => widget.stage == BuildStage.drying
      ? _dryingDelaySeconds
      : _otherDelaySeconds;

  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(stageTimerProvider);
    final reflectionState = ref.watch(reflectionSessionProvider);

    // Surface a reflection after the delay threshold
    if (!_surfaced && timer.elapsedSeconds >= _delaySeconds) {
      _surfaced = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(reflectionSessionProvider.notifier)
            .surfaceReflection(widget.stage);
      });
    }

    final reflection = reflectionState.currentReflection;
    if (reflection == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);

    // Check if the current reflection is relevant to this stage
    if (!reflection.relevantStages.contains(widget.stage)) {
      return const SizedBox.shrink();
    }

    return AnimatedSize(
      duration: AppDurations.medium,
      curve: AppDurations.easeCurve,
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.smAll,
          border: const Border(
            left: BorderSide(color: AppColors.shine, width: 3),
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                const Icon(
                  Icons.auto_stories_rounded,
                  size: 18,
                  color: AppColors.shine,
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Text(
                    reflection.title(l10n),
                    style: AppTypography.label,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),

            // Body text — 3 lines or full
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: AnimatedSize(
                duration: AppDurations.medium,
                curve: AppDurations.easeCurve,
                alignment: Alignment.topCenter,
                child: Text(
                  reflection.body(l10n),
                  style: AppTypography.caption.copyWith(color: AppColors.ink),
                  maxLines: _expanded ? null : 3,
                  overflow: _expanded ? null : TextOverflow.ellipsis,
                ),
              ),
            ),

            if (!_expanded)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xxs),
                child: GestureDetector(
                  onTap: () => setState(() => _expanded = true),
                  child: Text(
                    l10n.readMore,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.shine,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: AppSpacing.xs),

            // Source + read time
            Text(
              reflection.source(l10n),
              style: AppTypography.monoSm.copyWith(
                color: AppColors.inkFaint,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              l10n.estimatedReadTime(reflection.estimatedReadTime),
              style: AppTypography.monoSm.copyWith(
                color: AppColors.inkFaint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

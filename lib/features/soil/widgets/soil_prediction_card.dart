import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/soil_data.dart';
import '../providers/soil_prediction_provider.dart';

/// "Predict my dorodango" button plus the AI prediction result.
/// Costs 1 credit per prediction, like the other AI features.
class SoilPredictionCard extends ConsumerWidget {
  final SoilData soil;

  const SoilPredictionCard({super.key, required this.soil});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(soilPredictionProvider);

    return switch (state.status) {
      PredictionStatus.idle => _predictButton(context, ref, l10n.predictResult),
      PredictionStatus.loading => Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.clay,
                ),
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(l10n.predictingResult, style: AppTypography.caption),
            ],
          ),
        ),
      PredictionStatus.success => Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: AppColors.clay.withValues(alpha: 0.35)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome,
                      size: 16, color: AppColors.clay),
                  const SizedBox(width: AppSpacing.xs),
                  Text(l10n.predictionTitle, style: AppTypography.caption),
                ],
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(state.prediction ?? '', style: AppTypography.body),
            ],
          ),
        ),
      PredictionStatus.outOfCredits => Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Text(
            l10n.outOfCredits,
            style: AppTypography.caption.copyWith(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
        ),
      PredictionStatus.error => Column(
          children: [
            Text(
              l10n.predictionFailed,
              style: AppTypography.caption.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
            _predictButton(context, ref, l10n.retry),
          ],
        ),
    };
  }

  Widget _predictButton(BuildContext context, WidgetRef ref, String label) {
    return TextButton.icon(
      onPressed: () =>
          ref.read(soilPredictionProvider.notifier).predict(soil),
      icon: const Icon(Icons.auto_awesome, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(foregroundColor: AppColors.clay),
    );
  }
}

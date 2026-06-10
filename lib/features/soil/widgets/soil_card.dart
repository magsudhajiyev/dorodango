import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/soil_data.dart';

class SoilCard extends StatelessWidget {
  final SoilData data;

  const SoilCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final suitability = data.suitability;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.inkSoft.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.soilTypeLabel, style: AppTypography.caption),
          if (data.wrbClass != null) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(data.wrbClass!, style: AppTypography.h2),
          ],
          if (data.hasComposition) ...[
            const SizedBox(height: AppSpacing.sm),
            _CompositionBar(
              label: l10n.soilClay,
              pct: data.clayPct!,
              color: AppColors.clay,
            ),
            const SizedBox(height: AppSpacing.xs),
            _CompositionBar(
              label: l10n.soilSand,
              pct: data.sandPct!,
              color: AppColors.ochre,
            ),
            const SizedBox(height: AppSpacing.xs),
            _CompositionBar(
              label: l10n.soilSilt,
              pct: data.siltPct!,
              color: AppColors.earth,
            ),
          ],
          if (suitability != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              switch (suitability) {
                SoilSuitability.good => l10n.soilSuitabilityGood,
                SoilSuitability.okay => l10n.soilSuitabilityOkay,
                SoilSuitability.sandy => l10n.soilSuitabilitySandy,
              },
              style: AppTypography.caption.copyWith(
                color: switch (suitability) {
                  SoilSuitability.good => AppColors.success,
                  SoilSuitability.okay => AppColors.warning,
                  SoilSuitability.sandy => AppColors.error,
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CompositionBar extends StatelessWidget {
  final String label;
  final double pct;
  final Color color;

  const _CompositionBar({
    required this.label,
    required this.pct,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 64,
          child: Text(label, style: AppTypography.caption),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Container(
              height: 6,
              color: AppColors.surfaceSunk,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (pct / 100).clamp(0.0, 1.0),
                child: ColoredBox(color: color),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 48,
          child: Text(
            '${pct.round()}%',
            style: AppTypography.monoSm,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}

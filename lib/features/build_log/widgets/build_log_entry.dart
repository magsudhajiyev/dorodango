import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_model.dart';

class BuildLogEntry extends StatelessWidget {
  final BuildModel buildModel;
  final VoidCallback onTap;

  const BuildLogEntry({
    super.key,
    required this.buildModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dateFormat = DateFormat('MMM d, yyyy');
    final statusColor = switch (buildModel.status) {
      BuildStatus.completed => AppColors.moss,
      BuildStatus.inProgress => AppColors.ochre,
      BuildStatus.abandoned => AppColors.rust,
    };
    final statusLabel = switch (buildModel.status) {
      BuildStatus.completed => l10n.statusComplete,
      BuildStatus.inProgress => l10n.statusInProgress,
      BuildStatus.abandoned => l10n.statusAbandoned,
    };

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.lgAll,
          boxShadow: AppShadows.elev1,
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Earth icon placeholder
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppRadius.smAll,
              ),
              child: const Icon(
                Icons.circle,
                color: AppColors.earth,
                size: 24,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    buildModel.soilSource ?? l10n.unknownSoil,
                    style: AppTypography.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dateFormat.format(buildModel.startedAt),
                    style: AppTypography.monoSm,
                  ),
                ],
              ),
            ),

            // Status badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xxs,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: AppRadius.pillAll,
              ),
              child: Text(
                statusLabel,
                style: AppTypography.caption.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

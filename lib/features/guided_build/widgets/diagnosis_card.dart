import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/diagnosis_provider.dart';

class DiagnosisCard extends ConsumerWidget {
  final String buildId;
  final String stageKey;
  final String? photoUrl;

  const DiagnosisCard({
    super.key,
    required this.buildId,
    required this.stageKey,
    this.photoUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(diagnosisProvider);
    final l10n = AppLocalizations.of(context);

    return switch (state.status) {
      DiagnosisStatus.idle => const SizedBox.shrink(),
      DiagnosisStatus.loading => _CalloutBox(
          icon: Icons.auto_awesome,
          color: AppColors.clay,
          child: Row(
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
              Text(
                l10n.analyzingPhoto,
                style:
                    AppTypography.caption.copyWith(color: AppColors.ink),
              ),
            ],
          ),
        ),
      DiagnosisStatus.success => _CalloutBox(
          icon: Icons.auto_awesome,
          color: AppColors.clay,
          child: Text(
            state.diagnosis ?? '',
            style: AppTypography.caption.copyWith(color: AppColors.ink),
          ),
        ),
      DiagnosisStatus.error => GestureDetector(
          onTap: photoUrl != null
              ? () => ref.read(diagnosisProvider.notifier).diagnose(
                    buildId: buildId,
                    stageKey: stageKey,
                    photoUrl: photoUrl!,
                  )
              : null,
          child: _CalloutBox(
            icon: Icons.error_outline,
            color: AppColors.ochre,
            child: Text(
              l10n.diagnosisError,
              style:
                  AppTypography.caption.copyWith(color: AppColors.ink),
            ),
          ),
        ),
    };
  }
}

class _CalloutBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Widget child;

  const _CalloutBox({
    required this.icon,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.smAll,
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: AppSpacing.xs),
          Expanded(child: child),
        ],
      ),
    );
  }
}

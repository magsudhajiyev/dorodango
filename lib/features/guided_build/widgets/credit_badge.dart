import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/credits_provider.dart';

class CreditBadge extends ConsumerWidget {
  const CreditBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(creditsProvider);
    final isEmpty = credits <= 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: isEmpty
            ? AppColors.rust.withValues(alpha: 0.12)
            : AppColors.surface,
        borderRadius: AppRadius.pillAll,
        border: Border.all(
          color: isEmpty ? AppColors.rust : AppColors.inkFaint,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: 14,
            color: isEmpty ? AppColors.rust : AppColors.ochre,
          ),
          const SizedBox(width: AppSpacing.xxs),
          Text(
            '$credits',
            style: AppTypography.monoSm.copyWith(
              color: isEmpty ? AppColors.rust : AppColors.inkSoft,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

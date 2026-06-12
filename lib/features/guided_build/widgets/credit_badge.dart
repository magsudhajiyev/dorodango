import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../monetization/widgets/credit_paywall_sheet.dart';
import '../providers/credits_provider.dart';

/// Live credit balance pill. Every balance change floats a small delta
/// ("-1" in rust, "+25" in moss) off the badge so spending is visible
/// without looking away from the work.
class CreditBadge extends ConsumerStatefulWidget {
  const CreditBadge({super.key});

  @override
  ConsumerState<CreditBadge> createState() => _CreditBadgeState();
}

class _CreditBadgeState extends ConsumerState<CreditBadge> {
  int? _delta;
  int _deltaTick = 0;

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(creditsProvider, (previous, next) {
      if (previous == null || previous == next) return;
      setState(() {
        _delta = next - previous;
        _deltaTick++;
      });
    });

    final credits = ref.watch(creditsProvider);
    final isEmpty = credits <= 0;
    final delta = _delta;

    return GestureDetector(
      onTap: () => CreditPaywallSheet.show(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
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
          )
              .animate(key: ValueKey('pulse$_deltaTick'))
              .scaleXY(begin: 1, end: 1.12, duration: 120.ms)
              .then()
              .scaleXY(begin: 1.12, end: 1, duration: 180.ms),
          if (delta != null)
            Positioned(
              top: -4,
              right: -4,
              child: Text(
                delta > 0 ? '+$delta' : '$delta',
                style: AppTypography.monoSm.copyWith(
                  color: delta > 0 ? AppColors.moss : AppColors.rust,
                  fontWeight: FontWeight.w700,
                ),
              )
                  .animate(key: ValueKey('delta$_deltaTick'))
                  .moveY(begin: 0, end: -22, duration: 900.ms,
                      curve: Curves.easeOut)
                  .fadeOut(duration: 900.ms),
            ),
        ],
      ),
    );
  }
}

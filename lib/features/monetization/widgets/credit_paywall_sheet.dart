import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/purchase_provider.dart';
import '../services/purchase_service.dart';

/// Bottom sheet selling AI-coach credit packs. Purchases are validated by
/// the store and credits are granted by the RevenueCat webhook server-side.
class CreditPaywallSheet extends ConsumerWidget {
  const CreditPaywallSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const CreditPaywallSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final state = ref.watch(paywallProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: AppColors.ochre, size: 22),
                const SizedBox(width: AppSpacing.xs),
                Text(l10n.paywallTitle, style: AppTypography.h2),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.paywallSubtitle,
              style: AppTypography.body.copyWith(color: AppColors.inkSoft),
            ),
            const SizedBox(height: AppSpacing.lg),
            ...switch (state.status) {
              PaywallStatus.loading => [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.lg),
                      child:
                          CircularProgressIndicator(color: AppColors.clay),
                    ),
                  ),
                ],
              PaywallStatus.unavailable => [
                  _InfoBox(text: l10n.paywallUnavailable),
                ],
              PaywallStatus.error => [
                  _InfoBox(text: l10n.purchaseFailed),
                ],
              PaywallStatus.ready ||
              PaywallStatus.purchasing =>
                [
                  for (final (i, package) in state.packages.indexed)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _PackTile(
                        package: package,
                        highlight: PurchaseService.creditsFor(package) == 100,
                        busy: state.status == PaywallStatus.purchasing,
                        onBuy: () => _buy(context, ref, package),
                      )
                          .animate(delay: (70 * i).ms)
                          .fadeIn(duration: 250.ms)
                          .moveY(begin: 10, end: 0),
                    ),
                  TextButton(
                    onPressed: state.status == PaywallStatus.purchasing
                        ? null
                        : () => ref.read(paywallProvider.notifier).restore(),
                    child: Text(l10n.restorePurchases),
                  ),
                ],
            },
          ],
        ),
      ),
    );
  }

  Future<void> _buy(
      BuildContext context, WidgetRef ref, Package package) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final ok = await ref.read(paywallProvider.notifier).buy(package);
    if (ok) {
      messenger.showSnackBar(SnackBar(
        content: Text(l10n.purchaseSuccess),
        backgroundColor: AppColors.moss,
      ));
      if (navigator.canPop()) navigator.pop();
    } else {
      messenger.showSnackBar(SnackBar(content: Text(l10n.purchaseFailed)));
    }
  }
}

class _PackTile extends StatelessWidget {
  final Package package;
  final bool highlight;
  final bool busy;
  final VoidCallback onBuy;

  const _PackTile({
    required this.package,
    required this.highlight,
    required this.busy,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final credits = PurchaseService.creditsFor(package);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlight
              ? AppColors.clay
              : AppColors.inkSoft.withValues(alpha: 0.2),
          width: highlight ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      l10n.creditsBalance(credits),
                      style: AppTypography.label,
                    ),
                    if (highlight) ...[
                      const SizedBox(width: AppSpacing.xs),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.clay,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          l10n.packBestValue,
                          style: AppTypography.caption
                              .copyWith(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  package.storeProduct.title,
                  style: AppTypography.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: busy ? null : onBuy,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(96, 44),
            ),
            child: busy
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(package.storeProduct.priceString),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String text;

  const _InfoBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: AppTypography.body.copyWith(color: AppColors.inkSoft),
        textAlign: TextAlign.center,
      ),
    );
  }
}

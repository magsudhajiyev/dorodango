import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';
import '../../auth/providers/auth_provider.dart';
import '../../guided_build/providers/credits_provider.dart';
import '../../hunt/widgets/dorodango_ball.dart';
import '../../monetization/widgets/credit_paywall_sheet.dart';
import '../providers/profile_stats_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(creditsProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final user = ref.watch(authStateProvider).valueOrNull;
    final credits = ref.watch(creditsProvider);
    final statsAsync = ref.watch(profileStatsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.goNamed(RouteNames.home),
        ),
        title: Text(l10n.profile),
        actions: [
          IconButton(
            tooltip: l10n.settings,
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => context.goNamed(RouteNames.settings),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          // Identity
          Center(
            child: Column(
              children: [
                const DorodangoBall(size: 88)
                    .animate(onPlay: (c) => c.repeat(reverse: true))
                    .moveY(begin: 0, end: -6, duration: 1600.ms,
                        curve: Curves.easeInOut),
                const SizedBox(height: AppSpacing.md),
                Text(
                  user?.email ?? l10n.guestUser,
                  style: AppTypography.h2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).animate().fadeIn(duration: 350.ms),
          const SizedBox(height: AppSpacing.lg),

          // Credits
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: AppColors.inkSoft.withValues(alpha: 0.15)),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: AppColors.ochre),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    l10n.creditsBalance(credits),
                    style: AppTypography.label,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => CreditPaywallSheet.show(context),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 44),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md),
                  ),
                  child: Text(l10n.buyCredits),
                ),
              ],
            ),
          ).animate(delay: 80.ms).fadeIn(duration: 350.ms),
          const SizedBox(height: AppSpacing.md),

          // Stats
          statsAsync.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Center(
                child: CircularProgressIndicator(color: AppColors.clay),
              ),
            ),
            error: (_, _) => const SizedBox.shrink(),
            data: (stats) => Row(
              children: [
                _StatCard(value: stats.builds, label: l10n.statsBuilds),
                const SizedBox(width: AppSpacing.sm),
                _StatCard(value: stats.planted, label: l10n.statsPlanted),
                const SizedBox(width: AppSpacing.sm),
                _StatCard(value: stats.found, label: l10n.statsFound),
              ],
            ).animate(delay: 160.ms).fadeIn(duration: 350.ms),
          ),
          const SizedBox(height: AppSpacing.md),

          // Collection shortcut
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: AppColors.surface,
            leading:
                const Icon(Icons.inventory_2_rounded, color: AppColors.clay),
            title: Text(l10n.myCollection, style: AppTypography.label),
            trailing: const Icon(Icons.chevron_right_rounded,
                color: AppColors.inkFaint),
            onTap: () => context.pushNamed(RouteNames.collection),
          ).animate(delay: 240.ms).fadeIn(duration: 350.ms),
          const SizedBox(height: AppSpacing.md),

          // Log out
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            tileColor: AppColors.surface,
            leading: const Icon(Icons.logout_rounded, color: AppColors.rust),
            title: Text(
              l10n.logout,
              style: AppTypography.label.copyWith(color: AppColors.rust),
            ),
            onTap: () => _confirmLogout(context),
          ).animate(delay: 320.ms).fadeIn(duration: 350.ms),
        ],
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.bg,
        title: Text(l10n.logout, style: AppTypography.h2),
        content: Text(
          l10n.logoutWarning,
          style: AppTypography.body.copyWith(color: AppColors.inkSoft),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.rust),
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    // The router redirects to the welcome screen once the auth stream
    // emits the signed-out state.
    await ref.read(authRepositoryProvider).signOut();
  }
}

class _StatCard extends StatelessWidget {
  final int value;
  final String label;

  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: AppColors.inkSoft.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Text('$value', style: AppTypography.monoLg),
            const SizedBox(height: AppSpacing.xxs),
            Text(label, style: AppTypography.caption),
          ],
        ),
      ),
    );
  }
}

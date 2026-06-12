import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routing/route_names.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../hunt/widgets/dorodango_ball.dart';
import '../providers/auth_provider.dart';

/// First screen: a welcome pitch for signed-out users (Begin leads to the
/// login/register screen), or a brief loader while a session restores.
class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: authState.when(
            loading: () => _Loader(l10n: l10n),
            error: (e, _) => _Error(l10n: l10n, message: e.toString()),
            data: (user) => user == null
                // The router redirects signed-in users to /home.
                ? _buildWelcome(context, l10n)
                : _Loader(l10n: l10n),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(flex: 2),
        Center(
          child: const DorodangoBall(size: 110)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .moveY(begin: 0, end: -8, duration: 1600.ms,
                  curve: Curves.easeInOut),
        ).animate().fadeIn(duration: 500.ms).scaleXY(begin: 0.85, end: 1),
        const SizedBox(height: AppSpacing.lg),
        Text(
          l10n.appTitle,
          style: AppTypography.display,
          textAlign: TextAlign.center,
        ).animate(delay: 120.ms).fadeIn(duration: 450.ms).moveY(begin: 10, end: 0),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.appSubtitle,
          style: AppTypography.body.copyWith(color: AppColors.inkSoft),
          textAlign: TextAlign.center,
        ).animate(delay: 200.ms).fadeIn(duration: 450.ms),
        const SizedBox(height: AppSpacing.xl),
        for (final (i, feature) in [
          (Icons.spa_rounded, l10n.welcomeFeatureGuide),
          (Icons.mic_rounded, l10n.welcomeFeatureCoach),
          (Icons.explore_rounded, l10n.welcomeFeatureHunt),
        ].indexed) ...[
          _FeatureRow(icon: feature.$1, text: feature.$2)
              .animate(delay: (300 + i * 120).ms)
              .fadeIn(duration: 350.ms)
              .moveX(begin: -12, end: 0),
          if (i < 2) const SizedBox(height: AppSpacing.sm),
        ],
        const SizedBox(height: AppSpacing.lg),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: AppColors.shine.withValues(alpha: 0.25),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    size: 16, color: AppColors.ochre),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  l10n.welcomeFreeCredits(10),
                  style: AppTypography.caption.copyWith(color: AppColors.ink),
                ),
              ],
            ),
          ),
        )
            .animate(delay: 700.ms)
            .fadeIn(duration: 400.ms)
            .shimmer(delay: 400.ms, duration: 1200.ms, color: AppColors.shine),
        const Spacer(flex: 2),
        SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () => context.pushNamed(RouteNames.auth),
            child: Text(l10n.welcomeBegin),
          ),
        ).animate(delay: 500.ms).fadeIn(duration: 400.ms),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: AppColors.clay),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: AppTypography.body.copyWith(color: AppColors.inkSoft),
          ),
        ),
      ],
    );
  }
}

class _Loader extends StatelessWidget {
  final AppLocalizations l10n;

  const _Loader({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.appTitle, style: AppTypography.display),
          const SizedBox(height: AppSpacing.lg),
          const SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColors.clay,
            ),
          ),
        ],
      ),
    );
  }
}

class _Error extends ConsumerWidget {
  final AppLocalizations l10n;
  final String message;

  const _Error({required this.l10n, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.appTitle, style: AppTypography.display),
          const SizedBox(height: AppSpacing.lg),
          const Icon(Icons.error_outline, color: AppColors.rust, size: 48),
          const SizedBox(height: AppSpacing.md),
          Text(
            message,
            style: AppTypography.body.copyWith(color: AppColors.rust),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(
            onPressed: () => ref.invalidate(authStateProvider),
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}

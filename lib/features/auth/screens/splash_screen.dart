import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/auth_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(ensureAuthProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: authState.when(
            data: (_) => const SizedBox.shrink(),
            loading: () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.appTitle, style: AppTypography.display),
                const SizedBox(height: 24),
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
            error: (e, stack) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.appTitle, style: AppTypography.display),
                const SizedBox(height: AppSpacing.lg),
                const Icon(Icons.error_outline, color: AppColors.rust, size: 48),
                const SizedBox(height: AppSpacing.md),
                Text(
                  e.toString(),
                  style: AppTypography.body.copyWith(color: AppColors.rust),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  stack.toString().split('\n').take(5).join('\n'),
                  style: AppTypography.monoSm,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.lg),
                ElevatedButton(
                  onPressed: () => ref.invalidate(ensureAuthProvider),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

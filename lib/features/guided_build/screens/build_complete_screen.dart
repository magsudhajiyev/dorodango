import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';
import '../providers/build_session_provider.dart';
import '../../reflections/widgets/completion_reflection.dart';

class BuildCompleteScreen extends ConsumerWidget {
  final String buildId;

  const BuildCompleteScreen({super.key, required this.buildId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Shine gradient text effect (simplified for v1)
              Text(
                l10n.buildCompleteTitle,
                style: AppTypography.display.copyWith(
                  color: AppColors.earth,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),

              // Shine accent line
              Container(
                width: 80,
                height: 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.shine.withValues(alpha: 0.3),
                      AppColors.shine,
                      AppColors.shine.withValues(alpha: 0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              Text(
                l10n.buildCompleteBody,
                style: AppTypography.body.copyWith(color: AppColors.inkSoft),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.lg),

              const CompletionReflection(),

              const Spacer(),

              // Start another
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(buildSessionProvider.notifier).resetSession();
                    context.goNamed(RouteNames.home);
                  },
                  child: Text(l10n.startAnotherBuild),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // View log
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    ref.read(buildSessionProvider.notifier).resetSession();
                    context.goNamed(RouteNames.buildLog);
                  },
                  child: Text(l10n.viewBuildLog),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

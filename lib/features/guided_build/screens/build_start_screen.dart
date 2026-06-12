import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';
import '../../../core/constants/stage_content.dart';
import '../../../data/models/build_model.dart';
import '../../../data/models/soil_data.dart';
import '../../build_log/providers/build_log_provider.dart';
import '../providers/build_session_provider.dart';
import '../providers/stage_timer_provider.dart';
import '../../reflections/providers/reflection_provider.dart';
import '../../soil/providers/soil_provider.dart';
import '../../soil/services/location_service.dart';
import '../../soil/widgets/soil_card.dart';
import '../../soil/widgets/soil_prediction_card.dart';

class BuildStartScreen extends ConsumerStatefulWidget {
  const BuildStartScreen({super.key});

  @override
  ConsumerState<BuildStartScreen> createState() => _BuildStartScreenState();
}

class _BuildStartScreenState extends ConsumerState<BuildStartScreen> {
  final _soilController = TextEditingController();

  @override
  void dispose() {
    _soilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(buildSessionProvider);
    final inProgressBuild = ref.watch(inProgressBuildProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          // Scrolls only when the content outgrows the screen; otherwise
          // the Spacers center it as before.
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const Spacer(flex: 2),

                      // Title
                      Text(l10n.appTitle, style: AppTypography.display)
                          .animate()
                          .fadeIn(duration: 450.ms)
                          .moveY(begin: 10, end: 0, curve: Curves.easeOut),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.appSubtitle,
                        style: AppTypography.body
                            .copyWith(color: AppColors.inkSoft),
                      ).animate(delay: 100.ms).fadeIn(duration: 450.ms),

                      const Spacer(flex: 2),

                      // Continue Build card
                      if (inProgressBuild != null) ...[
                        _ContinueBuildCard(buildModel: inProgressBuild)
                            .animate(delay: 150.ms)
                            .fadeIn(duration: 350.ms),
                        const SizedBox(height: AppSpacing.lg),
                      ],

                      // Soil source, with detection and map tucked inside.
                      TextField(
                        controller: _soilController,
                        decoration: InputDecoration(
                          hintText: l10n.soilSourceHint,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                tooltip: l10n.detectSoil,
                                icon: const Icon(Icons.my_location_rounded,
                                    size: 20, color: AppColors.inkSoft),
                                onPressed: _detectSoil,
                              ),
                              IconButton(
                                tooltip: l10n.soilMap,
                                icon: const Icon(Icons.public_rounded,
                                    size: 20, color: AppColors.inkSoft),
                                onPressed: () =>
                                    context.pushNamed(RouteNames.soilMap),
                              ),
                            ],
                          ),
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),

                      // Compact soil result (chip), details in a sheet.
                      const _SoilStatusLine(),

                      const SizedBox(height: AppSpacing.lg),

                      // Start button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: session.isLoading ? null : _startBuild,
                          child: session.isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(l10n.startNewBuild),
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Footer navigation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _QuickLink(
                            icon: Icons.history_rounded,
                            label: l10n.buildLog,
                            onTap: () =>
                                context.goNamed(RouteNames.buildLog),
                          ),
                          _QuickLink(
                            icon: Icons.explore_rounded,
                            label: l10n.hunt,
                            color: AppColors.clay,
                            onTap: () => context.pushNamed(RouteNames.hunt),
                          ),
                          _QuickLink(
                            icon: Icons.auto_stories_rounded,
                            label: l10n.reflections,
                            onTap: () =>
                                context.goNamed(RouteNames.reflections),
                          ),
                          _QuickLink(
                            icon: Icons.person_rounded,
                            label: l10n.profile,
                            onTap: () =>
                                context.goNamed(RouteNames.profile),
                          ),
                        ],
                      ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
                      const SizedBox(height: AppSpacing.sm),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _detectSoil() async {
    await ref.read(soilProvider.notifier).detect();
    final data = ref.read(soilProvider)?.valueOrNull;
    if (data == null || !mounted) return;

    // Prefill the soil source field if the user hasn't typed anything.
    if (_soilController.text.trim().isEmpty) {
      final l10n = AppLocalizations.of(context);
      final parts = [
        if (data.wrbClass != null) data.wrbClass!,
        if (data.clayPct != null)
          '${l10n.soilClay} ${data.clayPct!.round()}%',
      ];
      _soilController.text = parts.join(' · ');
    }
  }

  Future<void> _startBuild() async {
    final soilSource = _soilController.text.trim();
    final notifier = ref.read(buildSessionProvider.notifier);
    ref.read(reflectionSessionProvider.notifier).resetSession();
    final buildId = await notifier.startNewBuild(
      soilSource: soilSource.isEmpty ? null : soilSource,
    );
    ref.read(stageTimerProvider.notifier).start();
    if (mounted) {
      context.goNamed(
        RouteNames.stage,
        pathParameters: {'buildId': buildId},
      );
    }
  }

  Future<void> _resumeBuild(BuildModel build) async {
    final notifier = ref.read(buildSessionProvider.notifier);
    ref.read(reflectionSessionProvider.notifier).resetSession();
    await notifier.resumeBuild(build.id);
    final session = ref.read(buildSessionProvider);
    if (session.stageEnteredAt != null) {
      final elapsed =
          DateTime.now().difference(session.stageEnteredAt!).inSeconds;
      ref.read(stageTimerProvider.notifier).startFrom(elapsed);
    } else {
      ref.read(stageTimerProvider.notifier).start();
    }
    if (mounted) {
      context.goNamed(
        RouteNames.stage,
        pathParameters: {'buildId': build.id},
      );
    }
  }
}

/// Compact status under the soil field: a spinner while detecting, a small
/// tappable chip with the result, or a tap-to-retry error caption.
class _SoilStatusLine extends ConsumerWidget {
  const _SoilStatusLine();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final soilState = ref.watch(soilProvider);

    if (soilState == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: soilState.when(
        loading: () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.inkSoft,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(l10n.soilDetecting, style: AppTypography.caption),
          ],
        ),
        error: (error, _) => InkWell(
          onTap: () => ref.read(soilProvider.notifier).detect(),
          child: Text(
            error is LocationPermissionException
                ? l10n.soilLocationDenied
                : l10n.soilLookupFailed,
            style: AppTypography.caption.copyWith(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
        ),
        data: (data) => Center(child: _SoilChip(data: data)),
      ),
    );
  }
}

class _SoilChip extends StatelessWidget {
  final SoilData data;

  const _SoilChip({required this.data});

  Color get _suitabilityColor => switch (data.suitability) {
        SoilSuitability.good => AppColors.success,
        SoilSuitability.okay => AppColors.warning,
        SoilSuitability.sandy => AppColors.error,
        null => AppColors.inkFaint,
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final parts = [
      if (data.wrbClass != null) data.wrbClass!,
      if (data.clayPct != null) '${l10n.soilClay} ${data.clayPct!.round()}%',
    ];

    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () => _showDetails(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(999),
          border:
              Border.all(color: AppColors.inkSoft.withValues(alpha: 0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _suitabilityColor,
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Flexible(
              child: Text(
                parts.join(' · '),
                style: AppTypography.caption.copyWith(color: AppColors.ink),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                size: 16, color: AppColors.inkFaint),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).scaleXY(begin: 0.95, end: 1);
  }

  void _showDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SoilCard(data: data),
              const SizedBox(height: AppSpacing.xs),
              SoilPredictionCard(soil: data),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _QuickLink({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color = AppColors.inkSoft,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xs,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              label,
              style: AppTypography.caption.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueBuildCard extends ConsumerWidget {
  final BuildModel buildModel;

  const _ContinueBuildCard({required this.buildModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final stageContent = StageContent(l10n);
    final stages = ref.watch(buildStagesProvider(buildModel.id));
    final activeStage = stages.valueOrNull
        ?.where((s) => s.durationSec == null)
        .lastOrNull;
    final stageName = activeStage != null
        ? stageContent.stageName(activeStage.stage)
        : null;
    final stageOrder = activeStage?.stage.order ?? 1;

    return GestureDetector(
      onTap: () {
        final parent =
            context.findAncestorStateOfType<_BuildStartScreenState>();
        parent?._resumeBuild(buildModel);
      },
      child: Container(
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
            Text(
              l10n.continueBuild,
              style: AppTypography.label.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              buildModel.soilSource ?? l10n.unknownSoil,
              style: AppTypography.body.copyWith(color: AppColors.inkSoft),
            ),
            if (stageName != null) ...[
              const SizedBox(height: AppSpacing.xxs),
              Text(
                l10n.stageProgress(stageOrder, stageName),
                style: AppTypography.label.copyWith(color: AppColors.inkSoft),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

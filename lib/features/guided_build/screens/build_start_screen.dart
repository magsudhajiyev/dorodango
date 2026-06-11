import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';
import '../../../core/constants/stage_content.dart';
import '../../../data/models/build_model.dart';
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
          // Scrolls only when the content (e.g. soil card + AI prediction)
          // outgrows the screen; otherwise the Spacers center it as before.
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
              const Spacer(flex: 2),

              // Title
              Text(l10n.appTitle, style: AppTypography.display),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.appSubtitle,
                style: AppTypography.body.copyWith(color: AppColors.inkSoft),
              ),

              const Spacer(flex: 2),

              // Continue Build card
              if (inProgressBuild != null)
                _ContinueBuildCard(buildModel: inProgressBuild),

              if (inProgressBuild != null)
                const SizedBox(height: AppSpacing.lg),

              // Soil source
              TextField(
                controller: _soilController,
                decoration: InputDecoration(
                  hintText: l10n.soilSourceHint,
                ),
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppSpacing.sm),

              // Soil type from location
              _SoilDetectSection(onDetect: _detectSoil),

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

              const SizedBox(height: AppSpacing.md),

              // Build log
              TextButton(
                onPressed: () => context.goNamed(RouteNames.buildLog),
                child: Text(
                  l10n.viewBuildLog,
                  style:
                      AppTypography.label.copyWith(color: AppColors.inkSoft),
                ),
              ),

              // Reflections library
              TextButton(
                onPressed: () => context.goNamed(RouteNames.reflections),
                child: Text(
                  'Reflections',
                  style:
                      AppTypography.label.copyWith(color: AppColors.inkSoft),
                ),
              ),

              // Dorodango hunt
              TextButton.icon(
                onPressed: () => context.pushNamed(RouteNames.hunt),
                icon: const Icon(Icons.explore_rounded,
                    size: 18, color: AppColors.clay),
                label: Text(
                  l10n.hunt,
                  style: AppTypography.label.copyWith(color: AppColors.clay),
                ),
              ),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => context.goNamed(RouteNames.settings),
        backgroundColor: AppColors.surface,
        child: const Icon(Icons.settings_rounded, color: AppColors.inkSoft),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
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

class _SoilDetectSection extends ConsumerWidget {
  final Future<void> Function() onDetect;

  const _SoilDetectSection({required this.onDetect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final soilState = ref.watch(soilProvider);

    if (soilState == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: _detectButton(l10n.detectSoil)),
          Flexible(child: _mapButton(context, l10n)),
        ],
      );
    }

    return soilState.when(
      loading: () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.inkSoft,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            l10n.soilDetecting,
            style: AppTypography.caption,
          ),
        ],
      ),
      error: (error, _) => Column(
        children: [
          Text(
            error is LocationPermissionException
                ? l10n.soilLocationDenied
                : l10n.soilLookupFailed,
            style: AppTypography.caption.copyWith(color: AppColors.error),
            textAlign: TextAlign.center,
          ),
          _detectButton(l10n.retry),
        ],
      ),
      data: (data) => Column(
        children: [
          SoilCard(data: data),
          const SizedBox(height: AppSpacing.xs),
          SoilPredictionCard(soil: data),
          _mapButton(context, l10n),
        ],
      ),
    );
  }

  Widget _detectButton(String label) {
    return TextButton.icon(
      onPressed: onDetect,
      icon: const Icon(Icons.my_location_rounded, size: 18),
      label: Text(label),
      style: TextButton.styleFrom(foregroundColor: AppColors.inkSoft),
    );
  }

  Widget _mapButton(BuildContext context, AppLocalizations l10n) {
    return TextButton.icon(
      onPressed: () => context.pushNamed(RouteNames.soilMap),
      icon: const Icon(Icons.public_rounded, size: 18),
      label: Text(l10n.soilMap),
      style: TextButton.styleFrom(foregroundColor: AppColors.inkSoft),
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

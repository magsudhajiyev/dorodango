import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/stage_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_model.dart';
import '../../../data/models/stage_model.dart';
import '../../../routing/route_names.dart';
import '../../guided_build/providers/build_session_provider.dart';
import '../providers/build_log_provider.dart';

class BuildDetailScreen extends ConsumerWidget {
  final String buildId;

  const BuildDetailScreen({super.key, required this.buildId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stagesAsync = ref.watch(buildStagesProvider(buildId));
    final buildsAsync = ref.watch(buildListProvider);
    final l10n = AppLocalizations.of(context);
    final stageContent = StageContent(l10n);

    // Check if this build is in progress
    final isInProgress = buildsAsync.valueOrNull
            ?.where((b) => b.id == buildId && b.status == BuildStatus.inProgress)
            .isNotEmpty ??
        false;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.buildDetail, style: AppTypography.h2),
      ),
      floatingActionButton: isInProgress
          ? FloatingActionButton.extended(
              onPressed: () async {
                await ref
                    .read(buildSessionProvider.notifier)
                    .resumeBuild(buildId);
                if (context.mounted) {
                  context.goNamed(
                    RouteNames.stage,
                    pathParameters: {'buildId': buildId},
                  );
                }
              },
              backgroundColor: AppColors.clay,
              icon: const Icon(Icons.play_arrow_rounded, color: Colors.white),
              label: Text(
                l10n.continueBuild,
                style: AppTypography.label.copyWith(color: Colors.white),
              ),
            )
          : null,
      body: stagesAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.clay),
        ),
        error: (e, _) => Center(
          child: Text(l10n.error(e.toString()), style: AppTypography.body),
        ),
        data: (stages) {
          if (stages.isEmpty) {
            return Center(
              child: Text(l10n.noStagesRecorded, style: AppTypography.body),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            itemCount: stages.length,
            itemBuilder: (context, index) {
              final stage = stages[index];
              final isLast = index == stages.length - 1;
              return _StageTimelineRow(
                stage: stage,
                stageContent: stageContent,
                isLast: isLast,
              );
            },
          );
        },
      ),
    );
  }
}

class _StageTimelineRow extends StatefulWidget {
  final StageModel stage;
  final StageContent stageContent;
  final bool isLast;

  const _StageTimelineRow({
    required this.stage,
    required this.stageContent,
    required this.isLast,
  });

  @override
  State<_StageTimelineRow> createState() => _StageTimelineRowState();
}

class _StageTimelineRowState extends State<_StageTimelineRow> {
  bool _expanded = false;

  bool get _hasDetails =>
      widget.stage.photoUrl != null || widget.stage.diagnosis != null;

  @override
  Widget build(BuildContext context) {
    final stage = widget.stage;
    final dateFormat = DateFormat('h:mm a');

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: stage.durationSec != null
                      ? AppColors.moss
                      : AppColors.ochre,
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.surfaceSunk,
                  ),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.md),

          // Content card
          Expanded(
            child: GestureDetector(
              onTap: _hasDetails
                  ? () => setState(() => _expanded = !_expanded)
                  : null,
              child: Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppRadius.mdAll,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row with chevron
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.stageContent.stageName(stage.stage),
                            style: AppTypography.label,
                          ),
                        ),
                        if (_hasDetails)
                          Icon(
                            _expanded
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            size: 20,
                            color: AppColors.inkFaint,
                          ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      dateFormat.format(stage.enteredAt),
                      style: AppTypography.monoSm,
                    ),
                    if (stage.durationSec != null) ...[
                      const SizedBox(height: AppSpacing.xxs),
                      Text(
                        _formatDuration(stage.durationSec!),
                        style: AppTypography.mono
                            .copyWith(color: AppColors.clay),
                      ),
                    ],

                    // Expanded: photo
                    if (_expanded && stage.photoUrl != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      ClipRRect(
                        borderRadius: AppRadius.smAll,
                        child: Image.network(
                          stage.photoUrl!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              height: 160,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!
                                    : null,
                                color: AppColors.clay,
                                strokeWidth: 2,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stack) {
                            return Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppColors.surface,
                                borderRadius: AppRadius.smAll,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.broken_image_rounded,
                                color: AppColors.inkFaint,
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    // Expanded: diagnosis
                    if (_expanded && stage.diagnosis != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: AppRadius.smAll,
                          border: const Border(
                            left: BorderSide(color: AppColors.clay, width: 3),
                          ),
                        ),
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.auto_awesome,
                                size: 18, color: AppColors.clay),
                            const SizedBox(width: AppSpacing.xs),
                            Expanded(
                              child: Text(
                                stage.diagnosis!,
                                style: AppTypography.caption
                                    .copyWith(color: AppColors.ink),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    if (h > 0) return '${h}h ${m}m';
    if (m > 0) return '${m}m ${s}s';
    return '${s}s';
  }
}

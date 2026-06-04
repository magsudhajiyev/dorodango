import 'package:flutter/material.dart';
import '../../../core/constants/stage_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_stage.dart';

class StageCard extends StatelessWidget {
  final BuildStage stage;
  final StageContent stageContent;

  const StageCard({super.key, required this.stage, required this.stageContent});

  @override
  Widget build(BuildContext context) {
    final instruction = stageContent.getInstruction(stage);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadius.lgAll,
        boxShadow: AppShadows.elev1,
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(instruction.title, style: AppTypography.h1),
          const SizedBox(height: AppSpacing.xs),
          Text(
            instruction.summary,
            style: AppTypography.body.copyWith(color: AppColors.inkSoft),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Steps
          ...instruction.steps.asMap().entries.map((entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      child: Text(
                        '${entry.key + 1}.',
                        style: AppTypography.mono
                            .copyWith(color: AppColors.clay),
                      ),
                    ),
                    Expanded(
                      child: Text(entry.value, style: AppTypography.body),
                    ),
                  ],
                ),
              )),

          const SizedBox(height: AppSpacing.md),

          // Tip box
          _CalloutBox(
            icon: Icons.lightbulb_outline,
            color: AppColors.moss,
            text: instruction.tip,
          ),
          const SizedBox(height: AppSpacing.sm),

          // Common mistake box
          _CalloutBox(
            icon: Icons.warning_amber_rounded,
            color: AppColors.ochre,
            text: instruction.commonMistake,
          ),
        ],
      ),
    );
  }
}

class _CalloutBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _CalloutBox({
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.smAll,
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              text,
              style: AppTypography.caption.copyWith(color: AppColors.ink),
            ),
          ),
        ],
      ),
    );
  }
}

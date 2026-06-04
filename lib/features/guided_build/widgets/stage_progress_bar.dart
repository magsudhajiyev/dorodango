import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_stage.dart';

class StageProgressBar extends StatelessWidget {
  final BuildStage currentStage;

  const StageProgressBar({super.key, required this.currentStage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: BuildStage.values.map((stage) {
        final isCompleted = stage.order < currentStage.order;
        final isCurrent = stage == currentStage;
        return Expanded(
          child: Row(
            children: [
              if (stage.order > 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted || isCurrent
                        ? AppColors.clay
                        : AppColors.surfaceSunk,
                  ),
                ),
              _Dot(
                isCompleted: isCompleted,
                isCurrent: isCurrent,
                label: stage.order.toString(),
              ),
              if (stage.order < BuildStage.values.length)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isCompleted ? AppColors.clay : AppColors.surfaceSunk,
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isCompleted;
  final bool isCurrent;
  final String label;

  const _Dot({
    required this.isCompleted,
    required this.isCurrent,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final size = isCurrent ? 32.0 : 24.0;
    final color = isCompleted
        ? AppColors.moss
        : isCurrent
            ? AppColors.clay
            : AppColors.surfaceSunk;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isCompleted || isCurrent) ? color : Colors.transparent,
        border: Border.all(color: color, width: 2),
      ),
      alignment: Alignment.center,
      child: Text(
        isCompleted ? '✓' : label,
        style: AppTypography.monoSm.copyWith(
          color: (isCompleted || isCurrent) ? Colors.white : AppColors.inkFaint,
          fontSize: isCurrent ? 14 : 12,
        ),
      ),
    );
  }
}

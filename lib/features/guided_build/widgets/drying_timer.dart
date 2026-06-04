import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../providers/stage_timer_provider.dart';

class DryingTimer extends ConsumerWidget {
  final Duration? suggestedDuration;

  const DryingTimer({super.key, this.suggestedDuration});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(stageTimerProvider);
    final l10n = AppLocalizations.of(context);
    final suggestedSec = suggestedDuration?.inSeconds ?? 0;
    final progress =
        suggestedSec > 0 ? (timer.elapsedSeconds / suggestedSec).clamp(0.0, 1.0) : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 110,
          height: 110,
          child: CustomPaint(
            painter: _TimerArcPainter(progress: progress),
            child: Center(
              child: Text(timer.formatted, style: AppTypography.monoLg),
            ),
          ),
        ),
        if (suggestedDuration != null) ...[
          const SizedBox(height: 8),
          Text(
            l10n.suggestedDuration(_formatDuration(suggestedDuration!, l10n)),
            style: AppTypography.monoSm,
          ),
        ],
      ],
    );
  }

  String _formatDuration(Duration d, AppLocalizations l10n) {
    if (d.inHours > 0) return l10n.durationHours(d.inHours);
    return l10n.durationMinutes(d.inMinutes);
  }
}

class _TimerArcPainter extends CustomPainter {
  final double progress;

  _TimerArcPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 6;

    // Background arc
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = AppColors.surfaceSunk
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round,
    );

    // Progress arc
    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * progress,
        false,
        Paint()
          ..color = AppColors.clay
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(_TimerArcPainter old) => old.progress != progress;
}

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

/// A polished mud sphere: clay gradient with an off-center shine highlight.
class DorodangoBall extends StatelessWidget {
  final double size;

  const DorodangoBall({super.key, this.size = 96});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          center: Alignment(-0.35, -0.4),
          radius: 1.1,
          colors: [
            Color(0xFFE8C99A), // shine highlight
            AppColors.clay,
            AppColors.clayDeep,
          ],
          stops: [0.0, 0.55, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.25),
            blurRadius: size * 0.16,
            offset: Offset(0, size * 0.08),
          ),
        ],
      ),
      child: Align(
        alignment: const Alignment(-0.45, -0.5),
        child: Container(
          width: size * 0.22,
          height: size * 0.22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.55),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.4),
                blurRadius: size * 0.12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

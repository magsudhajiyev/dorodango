import 'package:flutter/material.dart';

abstract final class AppColors {
  // Surfaces
  static const Color bg = Color(0xFFF4EFE6);
  static const Color surface = Color(0xFFEAE3D6);
  static const Color surfaceSunk = Color(0xFFE0D7C6);

  // Ink
  static const Color ink = Color(0xFF2B2420);
  static const Color inkSoft = Color(0xFF6B5E51);
  static const Color inkFaint = Color(0xFFA2978A);

  // Earth — brand core
  static const Color clay = Color(0xFFA6572E);
  static const Color clayDeep = Color(0xFF7E3F1F);
  static const Color earth = Color(0xFF5C4530);

  // Shine — reward, use sparingly
  static const Color shine = Color(0xFFD9B27C);

  // Functional
  static const Color moss = Color(0xFF7C8A5A);
  static const Color rust = Color(0xFFB4503C);
  static const Color ochre = Color(0xFFC98A2B);

  // Semantic aliases
  static const Color success = moss;
  static const Color error = rust;
  static const Color warning = ochre;
}

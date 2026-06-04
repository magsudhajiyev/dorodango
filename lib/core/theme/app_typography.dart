import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppTypography {
  // Display — Fraunces
  static TextStyle get display => GoogleFonts.fraunces(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: AppColors.ink,
        height: 40 / 34,
      );

  static TextStyle get h1 => GoogleFonts.fraunces(
        fontSize: 27,
        fontWeight: FontWeight.w500,
        color: AppColors.ink,
        height: 34 / 27,
      );

  static TextStyle get h2 => GoogleFonts.fraunces(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.ink,
        height: 30 / 22,
      );

  // Body — Hanken Grotesk
  static TextStyle get bodyLg => GoogleFonts.hankenGrotesk(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.ink,
        height: 28 / 18,
      );

  static TextStyle get body => GoogleFonts.hankenGrotesk(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.ink,
        height: 26 / 16,
      );

  static TextStyle get caption => GoogleFonts.hankenGrotesk(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.inkSoft,
        letterSpacing: 0.02 * 13,
        height: 18 / 13,
      );

  static TextStyle get label => GoogleFonts.hankenGrotesk(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.ink,
      );

  // Data — Spline Sans Mono
  static TextStyle get monoLg => GoogleFonts.splineSansMono(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: AppColors.ink,
      );

  static TextStyle get mono => GoogleFonts.splineSansMono(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.ink,
        height: 22 / 15,
      );

  static TextStyle get monoSm => GoogleFonts.splineSansMono(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.inkSoft,
      );
}

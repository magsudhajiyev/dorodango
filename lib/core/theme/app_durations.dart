import 'package:flutter/animation.dart';

abstract final class AppDurations {
  static const Duration fast = Duration(milliseconds: 220);
  static const Duration medium = Duration(milliseconds: 400);
  static const Duration slow = Duration(milliseconds: 700);

  static const Cubic easeCurve = Cubic(0.22, 0.61, 0.36, 1);
}

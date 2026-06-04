import 'package:flutter/material.dart';

abstract final class AppShadows {
  static const List<BoxShadow> elev1 = [
    BoxShadow(
      color: Color(0x0F2B2420),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> elev2 = [
    BoxShadow(
      color: Color(0x142B2420),
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];
}

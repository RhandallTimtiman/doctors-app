import 'package:flutter/material.dart';

abstract class ThemeColors {
  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.mainBackground,
    required this.primaryTextColor,
  });

  Color primary;
  Color secondary;

  Color mainBackground;
  Color background;

  Color white = const Color(0xffffffff);
  Color lightGray = const Color(0xffa9a9a9);
  Color primaryTextColor = Colors.black;
}

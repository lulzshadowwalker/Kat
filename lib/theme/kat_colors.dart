import 'package:flutter/material.dart';

class KatColors {
  /// #FFFFFF -> FFFFFF
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    /// #FFFFFF -> FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// FFFFFFFF -> 0xFFFFFFFF
    return Color(int.parse(opacity + color, radix: 16));
  }

  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  /// same color as theme
  /// ..
  /// dark theme => black
  /// light theme => white
  static Color same(BuildContext context) =>
      isLight(context) ? Colors.white : Colors.black;

  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color primaryContainer(BuildContext context) =>
      Theme.of(context).colorScheme.primaryContainer;

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static final Color cyan = colorFromHex('#56ABAC');
  static final Color green = colorFromHex('#70EA71');
  static final Color yellow = colorFromHex('#ffc800');
  static final Color red = colorFromHex('#ff4b4b');
  static const Color blue = Colors.lightBlue;
  static final Color muted = colorFromHex('999999');
  static const Color purple = Colors.deepPurple;
  static Color mutedLight = Colors.grey.shade200;
}

import 'package:flutter/material.dart';

class KatColors {
  /// #FFFFFF -> FFFFFF
  static Color fromHex(String hexColor, [String opacity = 'FF']) {
    /// #FFFFFF -> FFFFFF
    final String color = hexColor.replaceAll('#', '');

    /// FFFFFFFF -> 0xFFFFFFFF
    return Color(int.parse(opacity + color, radix: 16));
  }

  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;

  /// same color as the current theme
  ///
  /// - dark theme => black
  /// - light theme => white
  static Color same(BuildContext context) =>
      isLight(context) ? Colors.white : Colors.black;

  static Color scaffold(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static final Color green = fromHex('#70EA71');
  static final Color yellow = fromHex('#ffc800');
  static final Color red = fromHex('#ff4b4b');
  static const Color blue = Colors.lightBlue;
  static final Color muted = fromHex('999999');
  static final Color dark = fromHex('#121315');
  static final Color purple = fromHex('#6649B5');
  static final Color pink = fromHex('#E7DDFC');
  static final Color gold = fromHex('#DCBC8F');
  static Color mutedLight = Colors.grey.shade200;
}

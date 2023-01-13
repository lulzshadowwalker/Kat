import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kat/helpers/kat_fonts.dart';
import 'package:pie_menu/pie_menu.dart';
import '../helpers/kat_const.dart';
import 'kat_colors.dart';
import '../translations/kat_translations.dart';

class KatTheme {
  static final String? enFontFamily = GoogleFonts.kanit().fontFamily;
  static const String ruFontFamily = KatFonts.ukrainianPrincessShadow;

  static String? _fontFamily(BuildContext context) =>
      KatTranslations.currenetLangCode(context) == KatConst.en
          ? enFontFamily

          /// TODO find a better russian font
          : enFontFamily;

  /// returns a map of all the currently supported themes and their corresponding translated names
  static Map<Brightness, String> get themes => {
        Brightness.dark: KatTranslations.dark.tr(),
        Brightness.light: KatTranslations.light.tr(),
      };

  static String? currentThemeName(BuildContext context) =>
      themes[_brightness(context)];

  static Brightness _brightness(BuildContext context) =>
      Theme.of(context).brightness;

  /// returns [true] if current theme's brightness is [Brightness.light]
  // ignore: unrelated_type_equality_checks
  static bool get isLight => _brightness == Brightness.light;

  /// returns light by default, unless changed by the user in the settings.
  static ThemeMode get themeMode {
    final storage = GetStorage();

    final themeMode = storage.read<String>(KatConst.themeMode);
    switch (themeMode) {
      case KatConst.systemDefault:
        return ThemeMode.system;
      case KatConst.light:
        return ThemeMode.light;
      case KatConst.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  static const _dividerThemeData = DividerThemeData(
    thickness: 2,
    indent: 15,
    endIndent: 15,
  );

  static final _appBarTheme = ThemeData().appBarTheme.copyWith(
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
      );

  static const Color _seedColor = KatColors.purple;
  //
  // ─── DARK THEME ─────────────────────────────────────────────────────────────────
  //
  static ThemeData dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      useMaterial3: true,

      //
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: _seedColor,
      ),

      //
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: _fontFamily(context),
          ),

      //
      scaffoldBackgroundColor: KatColors.dark,

      //
      dividerTheme: _dividerThemeData,

      //
      appBarTheme: _appBarTheme,
    );
  }
  //
  // ─────────────────────────────────────────────────────────────── DARK THEME ─────
  //

  //
  // ─── LIGHT THEME ────────────────────────────────────────────────────────────────
  //
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      useMaterial3: true,

      //
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: _seedColor,
      ),

      //
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: _fontFamily(context),
          ),

      //
      dividerTheme: _dividerThemeData,

      //
      appBarTheme: _appBarTheme,
    );
  }
  //
  // ────────────────────────────────────────────────────────────── LIGHT THEME ─────
  //

  static PieTheme pieTheme(BuildContext context) => PieTheme(
        tooltipStyle: Theme.of(context).textTheme.headline3?.copyWith(
              fontWeight: FontWeight.bold,
              color: KatColors.muted,
            ),
        buttonThemeHovered: PieButtonTheme(
          backgroundColor: KatColors.primary(context),
          iconColor: KatColors.primaryContainer(context),
        ),
        buttonTheme: PieButtonTheme(
          backgroundColor: KatColors.primaryContainer(context),
          iconColor: KatColors.primary(context),
        ),
      );
}

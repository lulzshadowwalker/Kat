import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../helpers/kat_const.dart';
import '../theme/kat_theme.dart';
import '../views/auth/auth_imports.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeController, ThemeMode>(
    (ref) => ThemeModeController(KatTheme.themeMode));

class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController(ThemeMode mode) : super(mode);

  Future<void> mode(ThemeMode mode) async {
    state = mode;
    
    await GetStorage().write(KatConst.themeMode, mode.name);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';
import 'helpers/kat_const.dart';
import 'kat.dart';
import 'views/auth/auth_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();

  await GetStorage.init();

  /// removes the annoying '#' from the url
  setPathUrlStrategy();

  if (KatHelpers.isAndroidOrIos) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(KatConst.en),
        Locale(KatConst.ru),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(KatConst.en),
      startLocale: const Locale(KatConst.en),
      useOnlyLangCode: true,
      child: const ProviderScope(
        child: Kat(),
      ),
    ),
  );
}
    
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

import 'helpers/kat_const.dart';
import 'kat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();

  /// removes the annoying '#' from the url
  setPathUrlStrategy();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(KatConst.en),
        Locale(KatConst.ru),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(KatConst.en),
      useOnlyLangCode: true,
      child: const ProviderScope(
        child: Kat(),
      ),
    ),
  );
}

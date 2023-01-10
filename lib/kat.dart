import 'package:flutter/material.dart';
import 'router/kat_router.dart';
import 'theme/kat_theme.dart';
import 'views/auth/auth_imports.dart';

class Kat extends StatelessWidget {
  const Kat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Kat',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: KatTheme.light(context),
      darkTheme: KatTheme.dark(context),
      themeMode: ThemeMode.light,
      routerConfig: KatRouter.config,
    );
  }
}

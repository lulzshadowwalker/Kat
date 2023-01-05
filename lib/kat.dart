import 'package:flutter/material.dart';
import 'router/kat_router.dart';
import 'theme/kat_theme.dart';
import 'views/auth/auth_imports.dart';

class Kat extends ConsumerWidget {
  const Kat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Kat',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: KatTheme.light(context),
      darkTheme: KatTheme.dark(context),
      themeMode: ThemeMode.dark,
      routerConfig: KatRouter.config,
    );
  }
}

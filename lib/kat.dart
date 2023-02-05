import 'package:flutter/material.dart';
import 'providers/theme_mode_provider.dart';
import 'router/kat_router.dart';
import 'theme/kat_theme.dart';
import 'views/auth/auth_imports.dart';

class Kat extends ConsumerWidget {
  const Kat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Kat',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: KatTheme.light(context),
      darkTheme: KatTheme.dark(context),
      themeMode: themeMode,
      routerConfig: KatRouter.config,
    );
  }
}

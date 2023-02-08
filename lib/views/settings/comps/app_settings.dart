part of './settings_comps.dart';

class _AppSettings extends HookConsumerWidget {
  const _AppSettings();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = useState<bool>(!KatTheme.isLight(context));

    useEffect(() {
      isDarkMode.addListener(() {
        ref.read(themeModeProvider.notifier).mode(
              isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
            );
      });

      return null;
    });

    return _SettingsSection(
      title: KatTranslations.appSettings.tr(),
      options: [
        _SettingsOption(
          title: const Text(KatTranslations.language).tr(),
          trailing: DropdownButton(
            value: KatTranslations.currentLangCode(context),
            borderRadius: BorderRadius.circular(10),
            underline: Container(),
            elevation: 4,
            items: List.generate(
              KatTranslations.supportedLocales.length,
              (index) {
                final langCode =
                    KatTranslations.supportedLocales[index].languageCode;

                return DropdownMenuItem(
                  value: langCode,
                  child: Center(
                    child: SizedBox(
                      height: 25,
                      width: 35,
                      child: LanguageFlag(
                        language: Language.fromCode(langCode),
                      ),
                    ),
                  ),
                );
              },
            ),
            onChanged: (val) => context.setLocale(
              Locale(val ?? KatConst.en),
            ),
          ),
        ),
        _SettingsOption(
          title: const Text(KatTranslations.darkMode).tr(),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: AdvancedSwitch(
              controller: isDarkMode,
              activeColor: KatColors.purple,
              inactiveColor: KatColors.muted,
              thumb: Padding(
                padding: const EdgeInsets.all(1.0),
                child: CircleAvatar(
                  backgroundColor:
                      isDarkMode.value ? KatColors.gold : KatColors.mutedLight,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

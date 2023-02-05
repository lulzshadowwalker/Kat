part of './comps/settings_comps.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: KatAppBar(
        title: KatTranslations.settings.tr(),
      ),
      body: KatSingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SettingsProfileHeader(),
              const SizedBox(height: 32),
              const _AppSettings(),
              const _DeveloperNotice(),
              const Spacer(),
              if (!AuthController.isGuest)
                _SettingsOption(
                  margin: const EdgeInsets.only(bottom: 24),
                  title: Text(
                    KatTranslations.signOut,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: KatColors.muted),
                  ).tr(),
                  trailing: GestureDetector(
                    onTap: () {
                      AuthController.isGuest
                          ? context.goNamed(KatRoutes.signIn)
                          : AuthController.signOut(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: KatColors.pink,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.rightFromBracket,
                        size: 18,
                        color: KatColors.purple,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

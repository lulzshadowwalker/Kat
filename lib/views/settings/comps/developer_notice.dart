part of './settings_comps.dart';

class _DeveloperNotice extends StatelessWidget {
  const _DeveloperNotice();

  @override
  Widget build(BuildContext context) {
    return _SettingsSection(
      title: KatTranslations.devNotice.tr(),
      options: [
        _SettingsOption(
          title: const Text(KatTranslations.attributions).tr(),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => KatHelpers.push(
            context,
            const Attributions(),
          ),
        )
      ],
    );
  }
}

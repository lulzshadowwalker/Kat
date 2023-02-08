// ignore_for_file: unused_element
part of './settings_comps.dart';

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({
    required this.title,
    required this.options,
    this.padding,
  });

  final String title;
  final List<_SettingsOption> options;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: KatColors.muted),
          ),
          const SizedBox(height: 16),
          ...options,
        ],
      ),
    );
  }
}

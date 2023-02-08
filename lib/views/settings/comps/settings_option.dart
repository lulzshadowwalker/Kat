// ignore_for_file: unused_element

part of './settings_comps.dart';

class _SettingsOption extends StatelessWidget {
  const _SettingsOption({
    this.title,
    this.leading,
    this.trailing,
    this.onTap,
    this.margin,
    this.isWrapped = false,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final bool isWrapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(
          horizontal: isWrapped ? 16 : 0,
          vertical: 8,
        ),
        decoration: isWrapped
            ? BoxDecoration(
                color: KatTheme.isLight(context)
                    ? KatColors.mutedLight
                    : KatColors.muted,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Row(
          children: [
            leading,
            SizedBox(width: leading == null ? 0 : 8),
            title,
            const Spacer(),
            trailing,
          ].toCompactMap.toList(),
        ),
      ),
    );
  }
}

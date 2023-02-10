import 'package:flutter/material.dart';

import '../../../theme/kat_colors.dart';

class KatAppBar extends StatelessWidget with PreferredSizeWidget {
  const KatAppBar({
    required this.title,
    this.backgroundColor,
    this.foregroundColor,
    this.actions,
    super.key,
  });

  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: foregroundColor ?? KatColors.muted,
            ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2.0),
        child: Divider(
          color: KatColors.mutedLight,
          thickness: 1.5,
        ),
      ),
      actions: actions,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? KatColors.muted,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

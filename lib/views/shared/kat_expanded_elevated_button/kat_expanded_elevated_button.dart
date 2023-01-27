import 'package:flutter/material.dart';
import '../../../theme/kat_colors.dart';

/// minimally customizable elevated button that expands in the width
class KatExpandedElevatedButton extends StatelessWidget {
  const KatExpandedElevatedButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.fontWeight,
    super.key,
  });

  final VoidCallback onPressed;
  final Widget? leading;
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(35),
      ),
      icon: Padding(
        padding: leading == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 8),
        child: leading,
      ),
      label: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: fontWeight,
              color: foregroundColor ?? KatColors.purple,
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }
}

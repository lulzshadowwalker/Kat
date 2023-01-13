import 'package:flutter/material.dart';

import '../../../theme/kat_colors.dart';

/// muted container with round edges
class KatFormFieldBase extends StatelessWidget {
  const KatFormFieldBase({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: KatColors.mutedLight,
        borderRadius: BorderRadius.circular(50),
      ),
      child: child,
    );
  }
}

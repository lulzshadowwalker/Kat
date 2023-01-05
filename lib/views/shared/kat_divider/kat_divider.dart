import 'package:flutter/material.dart';

/// divider on the form of "----- child -----"
class KatDivider extends StatelessWidget {
  const KatDivider({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // one padding ([height]) is sufficient
        const Expanded(child: Divider(height: 65)),
        child,
        const Expanded(child: Divider()),
      ],
    );
  }
}

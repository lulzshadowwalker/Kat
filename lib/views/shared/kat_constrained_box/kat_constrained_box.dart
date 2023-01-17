import 'package:flutter/material.dart';

class KatConstrainedBox extends StatelessWidget {
  const KatConstrainedBox({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 550),
      child: child,
    );
  }
}

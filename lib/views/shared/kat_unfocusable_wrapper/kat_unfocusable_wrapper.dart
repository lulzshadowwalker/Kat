import 'package:flutter/material.dart';

class KatUnfocusableWrapper extends StatelessWidget {
  const KatUnfocusableWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}

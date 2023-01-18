import 'package:flutter/material.dart';
import '../../../hooks/use_kat_scale.dart';
import '../../auth/auth_imports.dart';

class KatAnimatedScale extends HookWidget {
  const KatAnimatedScale({
    this.index = 0,
    required this.child,
    super.key,
  });

  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    final scale = useKatScale();

    return AnimatedScale(
      scale: scale,
      curve: Curves.easeInCubic,
      duration: Duration(milliseconds: 75 * index % 20 + 400),
      child: child,
    );
  }
}

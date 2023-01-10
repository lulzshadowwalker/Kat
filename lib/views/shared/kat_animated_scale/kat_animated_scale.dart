import 'package:flutter/material.dart';

class KatAnimatedScale extends StatelessWidget {
  const KatAnimatedScale({
    this.index = 0,
    required this.scale,
    required this.child,
    super.key,
  });

  final double scale;
  final Widget child;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      curve: Curves.easeInCubic,
      duration: Duration(milliseconds: 75 * index % 20 + 400),
      child: child,
    );
  }
}

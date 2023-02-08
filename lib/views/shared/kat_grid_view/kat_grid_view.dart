import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../auth/auth_imports.dart';

class KatGridView extends HookWidget {
  const KatGridView({
    required this.children,
    this.physics,
    this.primary = true,
    this.padding,
    this.controller,
    super.key,
  });

  final List<Widget> children;
  final ScrollPhysics? physics;
  final bool primary;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final crossCount = KatHelpers.isMobileBp(context)
        ? 2
        : KatHelpers.isTabletBp(context)
            ? 3
            : 5;

    return MasonryGridView(
      controller: controller,
      shrinkWrap: true,
      primary: primary,
      padding: padding,
      physics: physics,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
      ),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      cacheExtent: 00,
      children: children,
    );
  }
}

import 'package:flutter/material.dart';

class KatPageBase extends StatelessWidget {
  /// simple page with custom back button if there is a previous page in the
  /// navigation stack
  const KatPageBase({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return Stack(
      children: [
        if (nav.canPop())
          Positioned(
            top: AppBar().preferredSize.height,
            left: 24,
            child: ElevatedButton(
              onPressed: () => nav.maybePop(),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
        child,
      ],
    );
  }
}

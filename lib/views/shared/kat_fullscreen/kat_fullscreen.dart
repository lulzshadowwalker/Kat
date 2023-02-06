import 'package:flutter/material.dart';

import '../../auth/auth_imports.dart';

class KatFullscreen extends StatelessWidget {
  const KatFullscreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KatHelpers.push(
        context,
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: KatColors.white,
          ),
          backgroundColor: KatColors.dark,
          body: Center(
            child: child,
          ),
        ),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kat/views/auth/auth_imports.dart';
import '../../../theme/kat_colors.dart';

class KatFullscreen extends StatelessWidget {
  const KatFullscreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
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
      ),
      child: child,
    );
  }
}

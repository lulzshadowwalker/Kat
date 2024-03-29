import 'package:flutter/material.dart';
import '../../../helpers/kat_anims.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.35,
        child: LottieBuilder.asset(
          KatAnims.loading,
          frameRate: FrameRate.max,
        ),
      ),
    );
  }
}

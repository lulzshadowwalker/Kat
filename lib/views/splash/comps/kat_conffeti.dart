part of './splash_comps.dart';

class _KatConffeti extends StatelessWidget {
  const _KatConffeti({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      KatAnim.confetti,
      frameRate: FrameRate.max,
      filterQuality: FilterQuality.high,
      repeat: false,
    );
  }
}

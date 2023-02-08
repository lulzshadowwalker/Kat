part of './profile_comps.dart';

class _ProfileAnim extends StatelessWidget {
  const _ProfileAnim();

  static const _guestAnims = [
    KatAnims.catHey,
    KatAnims.pigeon,
    KatAnims.ghibliKiki,
    KatAnims.owl,
  ];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.65,
      child: LottieBuilder.asset(
        _guestAnims.random,
        frameRate: FrameRate.max,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

part of './onboarding_comps.dart';

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.animation,
    required this.text,
    required this.foregroundColor,
  });

  final String text;
  final String animation;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        children: [
          //
          const Spacer(flex: 2),

          FractionallySizedBox(
            widthFactor: 0.85,
            child: LottieBuilder.asset(
              animation,
              frameRate: FrameRate.max,
              filterQuality: FilterQuality.high,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.fredokaOne(
              fontSize: 32,
              color: foregroundColor,
            ),
            textAlign: TextAlign.center,
          ),

          //
          const Spacer(flex: 4)
        ],
      ),
    );
  }
}

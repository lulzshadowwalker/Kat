// ignore_for_file: use_build_context_synchronously

part of './comps/onboarding_comps.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  /// <animation, text>
  static const _pages = {
    KatAnims.clown: 'sync ur cringe across all devices',
    KatAnims.cheeky: 'don\'t cringe alone\ncringe with friends',
  };

  static final List<Color> _colors = [
    KatColors.purple,
    KatColors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: _colors,
        itemCount: _pages.length, // null = infinity
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (int index) => _OnboardingPage(
          animation: _pages.keys.elementAt(index),
          text: _pages.values.elementAt(index),
          foregroundColor: _colors[(index + 1) % _colors.length],
        ),
        radius: 50,
        nextButtonBuilder: (_) => LottieBuilder.asset(
          KatAnims.nyanCat,
          frameRate: FrameRate.max,
          filterQuality: FilterQuality.high,
        ),
        onFinish: () async {
          await GetStorage().write(KatConst.spIsFirstLaunch, false);
          context.goNamed(KatRoutes.signUp);
        },
      ),
    );
  }
}

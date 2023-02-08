part of './comps/splash_comps.dart';

class Splash extends HookWidget {
  const Splash({Key? key}) : super(key: key);

  static Future<void> _start(BuildContext context) async {
    Future.delayed(
      const Duration(milliseconds: 3250),
      () => context.goNamed(KatRoutes.signUp),
    );
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => _start(context));
    useFuture(future);

    return Scaffold(
      backgroundColor: KatColors.pink,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: .0),
          child: KatSingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  KatAnims.cheeky,
                  frameRate: FrameRate.max,
                  filterQuality: FilterQuality.high,
                ),
                Text(
                  'uhm..',
                  style: GoogleFonts.fredokaOne(
                    fontSize: 46,
                    color: KatColors.purple,
                  ),
                ),
                Text(
                  '.cringe.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredokaOne(
                    fontSize: 18,
                    color: KatColors.purple.withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

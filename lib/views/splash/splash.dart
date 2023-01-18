part of './comps/splash_comps.dart';

class Splash extends HookWidget {
  const Splash({Key? key}) : super(key: key);

  static Future<void> _start(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 12),
      () {
        context.goNamed(KatRoutes.signUp);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => _start(context));
    useFuture(future);

    return Scaffold(
      backgroundColor: KatColors.primaryContainer(context),
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: RotatedBox(
              quarterTurns: 2,
              child: _KatConffeti(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(64.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  KatAnim.clown,
                  frameRate: FrameRate.max,
                  filterQuality: FilterQuality.high,
                ),
                Text(
                  'to Kate',
                  style: GoogleFonts.fredokaOne(
                    fontSize: 46,
                    color: KatColors.primary(context),
                  ),
                ),
                Text(
                  '''

happy birthday cutie pie

wish this year of your life is as beautful as your art and soul
be kind and sweet to yourself as you are to others

im proud of you
🤭
''',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.fredokaOne(
                    fontSize: 18,
                    color: KatColors.primary(context).withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
          const Align(alignment: Alignment.bottomCenter, child: _KatConffeti()),
        ],
      ),
    );
  }
}

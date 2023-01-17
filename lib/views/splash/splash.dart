import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kat/helpers/kat_anim.dart';
import 'package:kat/router/kat_routes.dart';
import 'package:kat/views/auth/auth_imports.dart';
import 'package:lottie/lottie.dart';

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
              child: _Conffeti(),
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
          const Align(alignment: Alignment.bottomCenter, child: _Conffeti()),
        ],
      ),
    );
  }
}

class _Conffeti extends StatelessWidget {
  const _Conffeti({
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

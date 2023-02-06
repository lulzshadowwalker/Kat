import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../helpers/kat_anim.dart';
import '../../router/kat_routes.dart';
import '../auth/auth_imports.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KatColors.pink,
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.25,
                  child: LottieBuilder.asset(
                    KatAnim.notFound[KatAnim.notFound.randomIndex],
                    frameRate: FrameRate.max,
                  ),
                ),
                const SizedBox(height: 8),
                SelectableText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: KatTranslations.oops.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: KatColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text: '\n${KatTranslations.pageDoesNotExist.tr()}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: KatColors.white.withOpacity(0.75),
                                ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () => context.goNamed(KatRoutes.home),
                  child: Text(
                    KatTranslations.goBackToHome.tr(),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

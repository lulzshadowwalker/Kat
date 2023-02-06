import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../helpers/kat_anim.dart';
import '../../helpers/kat_images.dart';
import '../auth/auth_imports.dart';
import 'package:lottie/lottie.dart';
import '../../models/attribution.dart';
import '../../models/enums/attribute_type.dart';
import '../kat_web_view/kat_web_view.dart';
import '../shared/kat_app_bar/kat_app_bar.dart';

class Attributions extends StatelessWidget {
  const Attributions({super.key});

  static final _attributions = <Attribution>[
    ...KatAnim.attributions,
    ...KatImages.attributions,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: KatAppBar(
        title: KatTranslations.attributions.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
          ),
          itemCount: _attributions.length,
          itemBuilder: (context, i) {
            final att = _attributions[i];

            return AspectRatio(
              aspectRatio: 1,
              child: Bounceable(
                onTap: () => _launchWebView(context, att),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 2,
                  child: GridTile(
                    footer: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: KatColors.purple.withOpacity(0.25),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.upRightFromSquare,
                            color: KatColors.purple,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    child: att.attributeType == AttributeType.anim
                        ? FractionallySizedBox(
                            widthFactor: 0.5,
                            child: LottieBuilder.asset(att.assetPath),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image.asset(
                              att.assetPath,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.low,
                            ),
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _launchWebView(BuildContext context, Attribution att) {
    KatHelpers.push(
      context,
      KatWebView(
        title: Uri.parse(att.url).host,
        url: att.url,
      ),
    );
  }
}

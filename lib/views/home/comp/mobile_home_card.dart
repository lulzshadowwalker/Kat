part of './home_comp.dart';

class _MobileHomeCard extends ConsumerWidget {
  const _MobileHomeCard({
    required this.index,
    required this.url,
  });

  final int index;
  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(processingInputProvider);
    final controller = ScreenshotController();

    return KatAnimatedScale(
      index: index,
      child: PieMenu(
        actions: [
          PieAction(
            tooltip: KatTranslations.addToFavs.tr(),
            onSelect: () {
              context.setLocale(const Locale('ru'));
              NotifController.showInDevPopup(context);
            },
            child: const Icon(Icons.favorite),
          ),
          PieAction(
            tooltip: KatTranslations.share.tr(),
            onSelect: () async {
              context.setLocale(const Locale('en'));
              NotifController.showInDevPopup(context);
            },
            child: const Icon(Icons.share),
          ),
          PieAction(
            tooltip: KatTranslations.download.tr(),
            onSelect: () {
              KatHelpers.downloadImage(
                context: context,
                controller: controller,
              );
            },
            child: const Icon(Icons.download),
          ),
        ],
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: KatColors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Screenshot(
            controller: controller,
            child: Image.network(
              url,
              loadingBuilder: (context, child, prog) {
                return prog == null
                    ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          child,
                          KatAnimatedScale(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: BorderedText(
                                strokeColor: KatColors.white,
                                strokeWidth: 2,
                                child: Text(
                                  text,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(color: Colors.red, height: 29, width:123);
              },
            ),
          ),
        ),
      ),
    );
  }
}

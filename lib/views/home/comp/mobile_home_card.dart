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
              NotifController.showInDevPopup(context);
            },
            child: const Icon(Icons.favorite),
          ),
          PieAction(
            tooltip: KatTranslations.share.tr(),
            onSelect: () {
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
            color: KatColors.mutedLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Screenshot(
            controller: controller,
            child: CachedNetworkImage(
              imageUrl: url,
              imageBuilder: (context, imageProvider) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(image: imageProvider),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: BorderedText(
                      strokeColor: KatColors.white,
                      strokeWidth: 2,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: KatColors.primaryContainer(context),
                highlightColor: KatColors.white,
                child: Container(
                  color: KatColors.mutedLight,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

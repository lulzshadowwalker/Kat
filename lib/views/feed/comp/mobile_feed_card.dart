part of 'feed_comp.dart';

class _MobileFeedCard extends ConsumerWidget {
  const _MobileFeedCard({
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
                widget: _ModifiedImage(
                  url: url,
                  text: text,
                  quality: FilterQuality.high,
                ),
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
            child: _ModifiedImage(
              url: url,
              text: text,
            ),
          ),
        ),
      ),
    );
  }
}

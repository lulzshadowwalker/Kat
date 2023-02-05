// ignore_for_file: use_build_context_synchronously

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
    final image = _ModifiedImage(
      url: url,
      text: text,
    );

    final isFav =
        ref.watch(userProvider).value?.favs?.containsKey(image.id) ?? false;

    return KatAnimatedScale(
      index: index,
      child: PieMenu(
        actions: [
          PieAction(
            tooltip: isFav
                ? KatTranslations.removeFromFavs.tr()
                : KatTranslations.addToFavs.tr(),
            onSelect: () => _toggleFav(
              context: context,
              text: text,
              imageId: image.id,
            ),
            child: Icon(
              isFav ? FontAwesomeIcons.heartCrack : FontAwesomeIcons.solidHeart,
            ),
          ),
          PieAction(
            tooltip: KatTranslations.share.tr(),
            onSelect: () {
              NotifController.showInDevPopup(context);
            },
            child: const Icon(FontAwesomeIcons.shareNodes),
          ),
          PieAction(
            tooltip: KatTranslations.download.tr(),
            onSelect: () {
              KatHelpers.downloadImage(
                context: context,
                widget: _higherResImage(text: text),
              );
            },
            child: const Icon(FontAwesomeIcons.download),
          ),
        ],
        child: GestureDetector(
          onDoubleTap: () => _toggleFav(
            context: context,
            text: text,
            imageId: image.id,
          ),
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: KatColors.mutedLight,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                image,
                if (isFav)
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: LottieBuilder.asset(
                      KatAnim.heart,
                      height: 28,
                      repeat: false,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _higherResImage({
    required String text,
  }) =>
      _ModifiedImage(
        url: url,
        text: text,
        quality: FilterQuality.high,
      );

  Future<void> _toggleFav({
    required BuildContext context,
    required String text,
    required imageId,
  }) async {
    if (KatHelpers.handleGuest(context)) return;

    final img = await ScreenshotController().captureFromWidget(
      _higherResImage(text: text),
    );

    await RemoteDbController.toggleFav(
      context: context,
      image: img,
      id: imageId,
    );
  }
}

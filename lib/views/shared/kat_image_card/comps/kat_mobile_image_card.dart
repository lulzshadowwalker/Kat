// ignore_for_file: use_build_context_synchronously

part of './kat_image_card_comps.dart';

class _KatMobileImageCard extends ConsumerWidget {
  const _KatMobileImageCard({
    required this.index,
    required this.url,
    required this.isFav,
    this.imageId,
    this.prompt,
  }) : assert((isFav == true && imageId != null) ||
            (isFav == false && imageId == null));

  final int index;
  final String url;
  final String? prompt;
  final bool isFav;
  final String? imageId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(userProvider).value?.favs?.keys.toList() ?? [];

    final text = prompt.maybeAsEmpty;
    final image = _ModifiedImage(
      url: url,
      text: text,
    );

    final isFav = this.isFav == false ? favs.contains(image.id) : this.isFav;

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
              imageId: imageId ?? image.id,
            ),
            child: Icon(
              isFav ? FontAwesomeIcons.heartCrack : FontAwesomeIcons.solidHeart,
            ),
          ),
          PieAction(
            tooltip: KatTranslations.share.tr(),
            onSelect: () => _shareImage(text),
            child: const Icon(FontAwesomeIcons.shareNodes),
          ),
          PieAction(
            tooltip: KatTranslations.download.tr(),
            onSelect: () => KatHelpers.downloadImage(
              context: context,
              widget: _higherResImage(text: text),
            ),
            child: const Icon(FontAwesomeIcons.download),
          ),
        ],
        child: GestureDetector(
          onDoubleTap: () => _toggleFav(
            context: context,
            text: text,
            imageId: imageId ?? image.id,
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
                      KatAnims.heart,
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

  Future<void> _shareImage(String text) async {
    final image = await ScreenshotController().captureFromWidget(
      _higherResImage(text: text),
    );

    final tempDirPath =
        await getTemporaryDirectory().then((value) => value.path);

    final file = await DefaultCacheManager().putFile(
      tempDirPath,
      image,
      fileExtension: ".jpg",
      maxAge: const Duration(minutes: 5),
    );

    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'abooba',
      text: 'abooba',
    );
  }

  Widget _higherResImage({required String text}) => _ModifiedImage(
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

    if (isFav) {
      await RemoteDbController.removeFav(
        context: context,
        id: imageId,
      );

      return;
    }

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

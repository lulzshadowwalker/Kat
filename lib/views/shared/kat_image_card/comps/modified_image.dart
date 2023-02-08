part of './kat_image_card_comps.dart';

class _ModifiedImage extends StatelessWidget {
  const _ModifiedImage({
    required this.url,
    required this.text,
    this.quality = FilterQuality.low,
  });

  final String url;
  final String text;
  final FilterQuality quality;

  /// returns an id generated based on [url] and the applied modifications
  String get id => const Uuid().v5(Uuid.NAMESPACE_URL, '$url$text');

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: CachedNetworkImage(
        imageUrl: url,
        fadeOutDuration: const Duration(milliseconds: 0),
        filterQuality: quality,
        imageBuilder: (context, imageProvider) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              image: imageProvider,
              filterQuality: quality,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: BorderedText(
                strokeColor: KatColors.black,
                strokeWidth: 2,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: (quality == FilterQuality.high
                          ? Theme.of(context).textTheme.headlineMedium
                          : Theme.of(context).textTheme.bodyLarge)
                      ?.copyWith(
                    color: KatColors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        placeholder: (context, url) {
          return Shimmer.fromColors(
            baseColor: KatColors.mutedLight,
            highlightColor: KatColors.white,
            child: Container(
              color: KatColors.mutedLight,
              width: double.infinity,
              height: 100,
            ),
          );
        },
      ),
    );
  }
}

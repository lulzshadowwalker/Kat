part of './feed_comp.dart';

class _ModifiedImage extends StatelessWidget {
  const _ModifiedImage({
    required this.url,
    required this.text,
    this.quality = FilterQuality.low,
  });

  final String url;
  final String text;
  final FilterQuality quality;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
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
        baseColor: KatColors.mutedLight,
        highlightColor: KatColors.white,
        child: Container(
          color: KatColors.mutedLight,
          width: double.infinity,
          height: 150,
        ),
      ),
    );
  }
}

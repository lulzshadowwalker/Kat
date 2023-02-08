part of './comps/kat_image_card_comps.dart';

class KatImageCard extends StatelessWidget {
  const KatImageCard({
    required this.index,
    required this.url,
    required this.isFav,
    this.imageId,
    this.prompt,
    super.key,
  });

  final int index;
  final String url;
  final String? prompt;
  final bool isFav;
  final String? imageId;

  @override
  Widget build(BuildContext context) {
    return KatHelpers.isAndroidOrIos
        ? _KatMobileImageCard(
            index: index,
            url: url,
            prompt: prompt,
            isFav: isFav,
            imageId: imageId,
          )
        : _KatWebImageCard(
            index: index,
            url: url,
            prompt: prompt,
          );
  }
}

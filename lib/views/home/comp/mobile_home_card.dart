part of './home_comp.dart';

class _MobileHomeCard extends HookWidget {
  const _MobileHomeCard({
    required this.index,
    required this.cat,
  });

  final int index;
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return KatAnimatedScale(
      index: index,
      child: PieMenu(
        actions: [
          PieAction(
            tooltip: KatTranslations.addToFavs.tr(),
            onSelect: () {},
            child: const Icon(Icons.favorite),
          ),
          PieAction(
            tooltip: KatTranslations.share.tr(),
            onSelect: () {},
            child: const Icon(Icons.share),
          ),
          PieAction(
            tooltip: KatTranslations.download.tr(),
            onSelect: () {},
            child: const Icon(Icons.download),
          ),
        ],
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          color: Colors.transparent,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: '${cat.url}',
          ),
        ),
      ),
    );
  }
}
// share, download(GIF, mp4, image)
// mobile(platform), always visible. desktop, animated expand on hover.
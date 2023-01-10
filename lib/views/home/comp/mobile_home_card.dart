part of './home_comp.dart';

class _MobileHomeCard extends HookWidget {
  const _MobileHomeCard({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final scale = useKatScale();

    return KatAnimatedScale(
      scale: scale,
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
            imageUrl:
                'https://images.unsplash.com/photo-1672760164718-8e42d512fd88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
          ),
        ),
      ),
    );
  }
}
// share, download(GIF, mp4, image)
// mobile(platform), always visible. desktop, animated expand on hover.
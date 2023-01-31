part of 'comp/feed_comp.dart';

class Feed extends HookConsumerWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPieMenuInactive = useState(false);
    final images = ref.watch(imagesProvider(context));

    useEffect(() {
      NotifController().init();
      return null;
    }, const []);

    final crossCount = KatHelpers.isMobileBp(context)
        ? 2
        : KatHelpers.isTabletBp(context)
            ? 3
            : 5;

    return PieCanvas(
      theme: KatTheme.pieTheme(context),
      onMenuToggle: (active) => isPieMenuInactive.value = active,
      child: KatUnfocusableWrapper(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: const _FeedAppBar(),
          body: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(imagesProvider);
            },
            displacement: 65,
            backgroundColor: KatColors.purple,
            color: KatColors.pink,
            edgeOffset: _FeedAppBar.height,
            child: MasonryGridView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: isPieMenuInactive.value
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
              ),
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              cacheExtent: 300,
              children: [
                /// app bar spacing when scrolled to top
                ...List.generate(
                  crossCount,
                  (index) => SizedBox(
                    height:
                        _FeedAppBar.height * (KatHelpers.isAndroid ? 1 : 1.5),
                  ),
                ),

                /// body
                ...List.generate(
                  images.length,
                  (index) => _FeedCard(
                    index: index,
                    url: images.elementAt(index),
                  ),
                ),

                /// bottom bar safe area when scrolled all the way to the bottom
                ...List.generate(
                  crossCount,
                  (index) => const SizedBox(height: kBottomNavigationBarHeight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

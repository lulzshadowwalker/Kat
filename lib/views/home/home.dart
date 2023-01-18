part of './comp/home_comp.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPieMenuInactive = useState(false);
    final images = ref.watch(imagesProvider(context));

    return PieCanvas(
      theme: KatTheme.pieTheme(context),
      onMenuToggle: (active) => isPieMenuInactive.value = active,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const _KatBottomNavBar(),

        /// TODO replace the [SliverAppBar] in [Home] with a custom implementation as apparently
        ///  the [NeverScrollableScrollPhysics] doesn't work in the [NestedScrollView]
        ///  for some reason
        ///  https://github.com/flutter/flutter/issues/45619
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent,
              floating: true,
              snap: true,
              collapsedHeight: AppBar().preferredSize.height * 1.5,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: KatConstrainedBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: _HomeSearchBar(),
                  ),
                ),
              ),
            ),
          ],
          body: MasonryGridView.count(
            itemCount: images.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            crossAxisCount: KatHelpers.isMobileBp(context)
                ? 2
                : KatHelpers.isTabletBp(context)
                    ? 3
                    : 5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            cacheExtent: 300,
            itemBuilder: (context, index) => _HomeCard(
              index: index,
              url: images.elementAt(index),
            ),
          ),
        ),
      ),
    );
  }
}

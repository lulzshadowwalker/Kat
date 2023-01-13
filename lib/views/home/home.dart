part of './comp/home_comp.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPieMenuInactive = useState(false);
    final cats = ref.watch(catsProvider(context));

    return PieCanvas(
      theme: KatTheme.pieTheme(context),
      onMenuToggle: (active) => isPieMenuInactive.value = active,
      child: Scaffold(
        /// TODO replace the [SliverAppBar] in [Home] with a custom implementation as apparently
        ///  the [NeverScrollableScrollPhysics] doesn't work in the [NestedScrollView]
        ///  for some reason
        ///  https://github.com/flutter/flutter/issues/45619
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: true,
              snap: true,
              collapsedHeight: AppBar().preferredSize.height * 1.5,
              flexibleSpace: const FlexibleSpaceBar(
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
          body: cats.when(
            data: (data) => MasonryGridView.count(
              itemCount: data.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: KatHelpers.isMobileBp(context)
                  ? 2
                  : KatHelpers.isTabletBp(context)
                      ? 3
                      : 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) => _HomeCard(
                index: index,
                cat: data[index],
              ),
            ),
            error: (error, stackTrace) => const Oops(),
            loading: () =>

                /// TODO home screen shimmer loading
                const Loading(),
          ),
        ),
      ),
    );
  }
}

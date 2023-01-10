part of './comp/home_comp.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPieMenuActive = useState(false);

    return PieCanvas(
      theme: PieTheme(
        delayDuration: Duration.zero,
        buttonThemeHovered: PieButtonTheme(
          backgroundColor: KatColors.primary(context),
          iconColor: KatColors.primaryContainer(context),
        ),
        buttonTheme: PieButtonTheme(
          backgroundColor: KatColors.primaryContainer(context),
          iconColor: KatColors.primary(context),
        ),
      ),
      onMenuToggle: (active) => isPieMenuActive.value = active,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              collapsedHeight: AppBar().preferredSize.height * 1.5,
              flexibleSpace: FlexibleSpaceBar(
                title: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 650,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: _HomeSearchBar(),
                  ),
                ),
              ),
            ),
          ],
          body: Expanded(
            child: MasonryGridView.count(
              physics: isPieMenuActive.value
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics(),
              itemCount: 100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: KatHelpers.isMobileBp(context)
                  ? 2
                  : KatHelpers.isTabletBp(context)
                      ? 3
                      : 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              itemBuilder: (context, index) => _HomeCard(index: index),
            ),
          ),
        ),
      ),
    );
  }
}

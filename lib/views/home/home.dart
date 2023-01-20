part of './comp/home_comp.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

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
          bottomNavigationBar: const _KatBottomNavBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const KatConstrainedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _HomeSearchBar(),
              ),
            ),
          ),
          body: MasonryGridView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: isPieMenuInactive.value
                ? const NeverScrollableScrollPhysics()
                : null,
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
                  height: AppBar().preferredSize.height * 1.85,
                ),
              ),

              /// bod
              ...List.generate(
                images.length,
                (index) => _HomeCard(
                  index: index,
                  url: images.elementAt(index),
                ),
              ),

              /// bottom bar safe area when scrolled all the way to the bottom
              ...List.generate(
                crossCount,
                (index) =>
                    const SizedBox(height: kBottomNavigationBarHeight * 2.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

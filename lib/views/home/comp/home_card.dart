part of './home_comp.dart';

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.index,
    required this.cat,
  });

  final int index;
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return KatHelpers.isAndroidOrIos
        ? _MobileHomeCard(index: index, cat: cat)
        : _WebHomeCard(index: index, cat: cat);
  }
}

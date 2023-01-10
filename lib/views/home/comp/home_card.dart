part of './home_comp.dart';

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return KatHelpers.isAndroidOrIos
        ? _MobileHomeCard(index: index)
        : _WebHomeCard(index: index);
  }
}

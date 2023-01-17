part of './home_comp.dart';

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.index,
    required this.url,
  });

  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return KatHelpers.isAndroidOrIos
        ? _MobileHomeCard(index: index, url: url)
        : _WebHomeCard(index: index, url: url);
  }
}

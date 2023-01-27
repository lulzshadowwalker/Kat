part of 'feed_comp.dart';

class _FeedCard extends StatelessWidget {
  const _FeedCard({
    required this.index,
    required this.url,
  });

  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return KatHelpers.isAndroidOrIos
        ? _MobileFeedCard(index: index, url: url)
        : _WebFeedCard(index: index, url: url);
  }
}

part of 'feed_comp.dart';

class _FeedAppBar extends StatelessWidget with PreferredSizeWidget {
  const _FeedAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: const KatConstrainedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 60),
          child: _FeedSearchBar(),
        ),
      ),
    );
  }

  static double get height => AppBar().preferredSize.height * 1.8;

  @override
  Size get preferredSize => Size.fromHeight(height);
}

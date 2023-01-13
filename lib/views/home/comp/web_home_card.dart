part of './home_comp.dart';

class _WebHomeCard extends HookWidget {
  const _WebHomeCard({
    required this.index,
    required this.cat,
  });

  final int index;
  static const _duration = Duration(milliseconds: 240);
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final isHovering = useState(false);

    return KatAnimatedScale(
      index: index,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: Colors.transparent,
        child: MouseRegion(
          onHover: (_) => isHovering.value = true,
          onExit: (_) => isHovering.value = false,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const Placeholder(),
              Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                visible: isHovering.value,
                child: AnimatedSize(
                  duration: _duration,
                  reverseDuration: _duration,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x00795548), Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    height: isHovering.value ? null : 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.download,
                            color: Colors.white,
                            size: 16,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 16,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: KatColors.red,
                            size: 16,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// share, download(GIF, mp4, image)
// mobile(platform), always visible. desktop, animated expand on hover.
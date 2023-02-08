part of './kat_image_card_comps.dart';

class _KatWebImageCard extends HookConsumerWidget {
  const _KatWebImageCard({
    required this.index,
    required this.url,
    this.prompt,
  });

  final int index;
  static const _duration = Duration(milliseconds: 240);
  final String url;
  static final _borderRadius = BorderRadius.circular(15);
  final String? prompt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = prompt.maybeAsEmpty;

    final isHovering = useState(false);

    return KatAnimatedScale(
      index: index,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: KatColors.black,
          borderRadius: _borderRadius,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (_) => isHovering.value = true,
          onExit: (_) => isHovering.value = false,
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => KatFullscreen(
                    child: Container(
                      foregroundDecoration: BoxDecoration(
                        color: isHovering.value
                            ? KatColors.black.withOpacity(0.35)
                            : null,
                        borderRadius: _borderRadius,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image(image: imageProvider),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: BorderedText(
                              strokeColor: KatColors.white,
                              strokeWidth: 2,
                              child: Text(
                                text,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(),
                ),
                Visibility(
                  maintainState: true,
                  maintainAnimation: true,
                  maintainSize: true,
                  visible: isHovering.value,
                  child: AnimatedSize(
                    duration: _duration,
                    reverseDuration: _duration,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: isHovering.value ? null : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.favorite_border,
                              color: KatColors.red,
                              size: 24,
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
      ),
    );
  }
}
// share, download(GIF, mp4, image)
// mobile(platform), always visible. desktop, animated expand on hover.
part of './home_comp.dart';

class _HomeSearchBar extends HookConsumerWidget {
  const _HomeSearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGif = useState(false);
    final showcaseWord = ref.watch(wordsProvider).asData;

    return Container(
      height: 48,
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: KatColors.mutedLight,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                /// TODO search hints on supported tags
                cursorColor: KatColors.black,
                decoration: InputDecoration.collapsed(
                    hintText:
                        tr(showcaseWord?.value ?? KatTranslations.saySomething),
                    hintStyle: _textStyle(context)),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: KatColors.black),
              ),
            ),
          ),
          DropdownButton(
            style: _textStyle(context),
            borderRadius: BorderRadius.circular(8),
            elevation: 2,
            iconEnabledColor: KatColors.muted,
            hint: Text('Tags', style: _textStyle(context)),
            onTap: () {},
            items: const [
              /// TODO search bar tags
              DropdownMenuItem(value: 1, child: Text('hello')),
              DropdownMenuItem(value: 2, child: Text('hello')),
              DropdownMenuItem(value: 3, child: Text('hello')),
            ],
            onChanged: (v) {},
          ),
          const VerticalDivider(),
          Expanded(
            child: GestureDetector(
              onTap: () => isGif.value = !isGif.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                color: isGif.value
                    ? KatColors.primaryContainer(context)
                    : KatColors.muted,
                alignment: Alignment.center,
                height: double.infinity,
                child: Text(
                  KatTranslations.gif.tr(),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: isGif.value
                            ? KatColors.primary(context)
                            : KatColors.white,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static TextStyle? _textStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2?.copyWith(
            overflow: TextOverflow.ellipsis,
            color: KatColors.muted,
          );
}

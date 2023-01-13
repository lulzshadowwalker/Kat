part of './home_comp.dart';

class _HomeSearchBar extends HookConsumerWidget {
  const _HomeSearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGif = useState(false);
    final showcaseWord = ref.watch(wordsProvider).asData;
    final tags = ref.watch(catTagsProvider(context)).asData;
    final selectedTags = ref.watch(selectedTagsNotifierProvider.notifier);

    return KatFormFieldBase(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText:
                        tr(showcaseWord?.value ?? KatTranslations.saySomething),
                    hintStyle: _textStyle(context)),
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontFamily: KatTheme.enFontFamily,
                      color: KatColors.black,
                    ),
              ),
            ),
          ),
          if (tags != null && tags.hasValue)
            Expanded(
              child: GestureDetector(
                /// TODO, tags button should change color in response to whether
                ///  the results are filtered. e.g. cats dogs but not ducks or whatever
                onTap: () => _showTagsSheet(context, selectedTags, tags),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  color: KatColors.primaryContainer(context),
                  alignment: Alignment.center,
                  height: double.infinity,
                  child: Text(
                    KatTranslations.tags.tr(),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontFamily: KatTheme.enFontFamily,
                          color: KatColors.primary(context),
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
            fontFamily: KatTheme.enFontFamily,
            overflow: TextOverflow.ellipsis,
            color: KatColors.muted,
          );

  void _showTagsSheet(
    BuildContext context,
    SelectedTagsNotifier selectedTags,
    AsyncData<List<CatTag>>? tags,
  ) =>
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _TagsSheet(
          tags: tags,
          selectedTags: selectedTags,
        ),
      );
}

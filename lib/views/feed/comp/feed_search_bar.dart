part of 'feed_comp.dart';

class _FeedSearchBar extends HookConsumerWidget {
  const _FeedSearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final processingInput = ref.watch(processingInputProvider);
    final searchTerms = ref.watch(searchTermsProvider.notifier);
    final tags = ref.watch(selectedTagsProvider);

    return KatFormFieldBase(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(80),
                ],
                decoration: InputDecoration.collapsed(
                  hintText: processingInput,
                  hintStyle: _textStyle(context),
                ),
                onChanged: (value) => searchTerms.state = value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: KatTheme.enFontFamily,
                      color: KatColors.black,
                    ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                builder: (context) => const _TagsSheet(),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                color: tags.areAllSelected ? KatColors.pink : KatColors.purple,
                alignment: Alignment.center,
                height: double.infinity,
                child: Text(
                  KatTranslations.tags.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: KatTheme.enFontFamily,
                        color: tags.areAllSelected
                            ? KatColors.purple
                            : KatColors.mutedLight,
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
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: KatTheme.enFontFamily,
            overflow: TextOverflow.ellipsis,
            color: KatColors.muted,
          );
}

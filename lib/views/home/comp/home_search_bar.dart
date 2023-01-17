part of './home_comp.dart';

class _HomeSearchBar extends HookConsumerWidget {
  const _HomeSearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final processingInput = ref.watch(processingInputProvider);
    final searchTerms = ref.watch(searchTermsProvider.notifier);

    return KatFormFieldBase(
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: processingInput,
                  hintStyle: _textStyle(context),
                ),
                onChanged: (value) => searchTerms.state = value,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontFamily: KatTheme.enFontFamily,
                      color: KatColors.black,
                    ),
              ),
            ),
          ),
            Expanded(
              child: GestureDetector(
                /// TODO, tags button should change color in response to whether
                ///  the results are filtered. e.g. cats dogs but not ducks or whatever
                onTap: () => 
                showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => _TagsSheet(
        ),
                ),
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

 
      
}

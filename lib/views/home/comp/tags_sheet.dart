part of './home_comp.dart';

class _TagsSheet extends StatelessWidget {
  const _TagsSheet({
    Key? key,
    required this.tags,
    required this.selectedTags,
  }) : super(key: key);

  final AsyncData<List<CatTag>>? tags;
  final SelectedTagsNotifier selectedTags;

  @override
  Widget build(BuildContext context) {
    return KatConstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: KatColors.scaffold(context),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.25,
          initialChildSize: 0.35,
          maxChildSize: 0.6,
          builder: (context, scrollController) => Padding(
            padding: const EdgeInsets.all(42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  KatTranslations.tags.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: _TagsSheetSearchBar(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: List.generate(
                          tags!.value.length,
                          (index) {
                            final tag = tags!.value[index];

                            return KatCheckBoxListTile(
                              title: Text(tag),
                              value: selectedTags.value.contains(tag),
                              onChanged: (val) {
                                selectedTags.toggleSelect(tag);
                              },
                            );
                          },
                        ),
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

class _TagsSheetSearchBar extends HookWidget {
  const _TagsSheetSearchBar();

  @override
  Widget build(BuildContext context) {
    final searchTerms = useState<String?>(null);
    final searchCon = useTextEditingController();

    return KatFormFieldBase(
      child: TextField(
        controller: searchCon,
        onChanged: (val) => searchTerms.value = val,
      ),
    );
  }
}

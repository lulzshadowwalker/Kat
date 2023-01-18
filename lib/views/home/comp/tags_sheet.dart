part of './home_comp.dart';

class _TagsSheet extends ConsumerWidget {
  const _TagsSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(tagsProvider);
    final selectedTags = ref.watch(selectedTagsProvider);

    return KatConstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
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
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: List.generate(
                        tags.length,
                        (index) {
                          final tag = tags[index];

                          return KatCheckBoxListTile(
                            title: Text(tag.tr()),
                            value: selectedTags.tags.contains(tag),
                            onChanged: (val) {
                              ref
                                  .read(selectedTagsProvider.notifier)
                                  .toggleSelect(tag);
                            },
                          );
                        },
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

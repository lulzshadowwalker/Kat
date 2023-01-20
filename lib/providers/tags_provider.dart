import 'dart:collection';

import '../controllers/selected_tags_notifier.dart';

import '../views/auth/auth_imports.dart';

final tagsProvider = Provider<List<String>>((ref) {
  return UnmodifiableListView(
    [
      KatTranslations.all,
      KatTranslations.cats,
      KatTranslations.dogs,
      KatTranslations.birds,
      KatTranslations.fishes,
      KatTranslations.clowns,
      KatTranslations.monkeys,
    ],
  );
});

final selectedTagsProvider = ChangeNotifierProvider((ref) {
  final allTags = ref.watch(tagsProvider);

  return SelectedTagsNotifier(List.from(allTags));
});

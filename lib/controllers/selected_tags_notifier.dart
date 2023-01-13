import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/typedefs.dart';

class SelectedTagsNotifier extends StateNotifier<List<CatTag>> {
  SelectedTagsNotifier(super.state);

  List<CatTag> get value => UnmodifiableListView(state);

  void toggleSelect(CatTag tag) {
    if (state.contains(tag)) {
      state = state..remove(tag);
      return;
    }

    state = state..add(tag);
  }
}

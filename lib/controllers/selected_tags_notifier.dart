import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:kat/views/auth/auth_imports.dart';

class SelectedTagsNotifier extends ChangeNotifier {
  SelectedTagsNotifier(List<String> tags)
      : _tags = List.from(tags),
        _allTags = UnmodifiableListView(tags);

  List<String> _tags;
  final List<String> _allTags;

  List<String> get tags => UnmodifiableListView(_tags);

  void toggleSelect(String tag) {
    if (!_tags.contains(tag)) {
      tag != KatTranslations.all ? _tags.add(tag) : _tags = List.from(_allTags);
      notifyListeners();
      return;
    }

    if (_tags.length <= 1) return;

    if (tag != KatTranslations.all) {
      _tags
        ..remove(tag)
        ..remove(KatTranslations.all);
    } else {
      _tags.removeRange(0, _tags.length - 1);
    }

    notifyListeners();
  }

  bool get areAllSelected => _tags.length == _allTags.length;
}

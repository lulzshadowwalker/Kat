import 'dart:collection';

import 'package:flutter/cupertino.dart';

class SelectedTagsNotifier extends ChangeNotifier {
  SelectedTagsNotifier(List<String> tags) : _tags = tags;
  final List<String> _tags;

  List<String> get tags => UnmodifiableListView(_tags);

  void toggleSelect(String tag) {
    _tags.contains(tag) && _tags.length > 1
        ? _tags.remove(tag)
        : _tags.add(tag);

    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kat/controllers/apis/cats_api.dart';
import 'package:kat/controllers/selected_tags_notifier.dart';
import '../helpers/typedefs.dart';

final catTagsProvider =
    FutureProvider.family<List<CatTag>, BuildContext>((ref, context) {
  return CatsApi.fetchTags(context);
});

final selectedTagsNotifierProvider =
    StateNotifierProvider<SelectedTagsNotifier, List<CatTag>>((ref) {
  return SelectedTagsNotifier([]);
});

/// TODO filtered tags provider 
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/apis/cats_api.dart';

final catTagsProvider =
    FutureProvider.family<List<String>, BuildContext>((ref, context) {
  return CatsApi.fetchTags(context);
});

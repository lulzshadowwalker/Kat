import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kat/controllers/apis/cats_api.dart';
import 'package:kat/models/cat.dart';

final catsProvider =
    FutureProvider.family<List<Cat>, BuildContext>((ref, context) {
  return CatsApi.fetchCats(context);
});

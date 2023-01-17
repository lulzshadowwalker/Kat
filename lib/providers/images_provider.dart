import 'package:flutter/material.dart';
import 'package:kat/controllers/apis/cats_api.dart';
import 'package:kat/controllers/apis/dogs_api.dart';
import 'package:kat/controllers/apis/shibes_api.dart';
import 'package:kat/models/cat.dart';
import 'package:kat/providers/tags_provider.dart';
import 'package:kat/views/auth/auth_imports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'images_provider.g.dart';

@riverpod
Future<List<Cat>> cats(CatsRef ref, BuildContext context) {
  return CatsApi.fetchCats(context);
}

@riverpod
Future<List<String>> shibes(ShibesRef ref, BuildContext context) {
  return ShibesApi.fetchShibes(context);
}

@riverpod
Future<List<String>> birds(BirdsRef ref, BuildContext context) {
  return ShibesApi.fetchBirds(context);
}

@riverpod
Future<List<String>> dogs(DogsRef ref, BuildContext context) {
  return DogsApi.fetchDogs(context);
}

@riverpod
List<String> images(ImagesRef ref, BuildContext context) {
  final images = <String>[];
  final selectedTags = ref.watch(selectedTagsProvider);
  ref
    ..watch(catsProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.cats)) {
          images.addAll(
            v.map((e) => e.url).toCompactMap,
          );
        }
      },
    )
    ..watch(shibesProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.dogs)) {
          images.addAll(v);
        }
      },
    )
    ..watch(dogsProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.dogs)) {
          images.addAll(v);
        }
      },
    )
    ..watch(birdsProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.birds)) {
          images.addAll(v);
        }
      },
    );

  return images..shuffle();
}

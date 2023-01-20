import 'package:flutter/material.dart';
import 'package:kat/controllers/apis/pexels_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../controllers/apis/cats_api.dart';
import '../controllers/apis/dogs_api.dart';
import '../controllers/apis/shibes_api.dart';
import '../models/cat.dart';
import '../views/auth/auth_imports.dart';
import 'tags_provider.dart';

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
Future<List<String>> monkeys(MonkeysRef ref, BuildContext context) =>
    PexelsApi.search(context, 'monkey').then(
      (v) => v?.urls ?? [],
    );

@riverpod
Future<List<String>> fishes(FishesRef ref, BuildContext context) =>
    PexelsApi.search(context, 'fish').then(
      (v) => v?.urls ?? [],
    );

@riverpod
Future<List<String>> clowns(ClownsRef ref, BuildContext context) =>
    PexelsApi.search(context, 'clown').then(
      (v) => v?.urls ?? [],
    );

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
    )
    ..watch(monkeysProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.monkeys)) {
          images.addAll(v);
        }
      },
    )
    ..watch(clownsProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.clowns)) {
          images.addAll(v);
        }
      },
    )
    ..watch(fishesProvider(context)).whenData(
      (v) {
        if (selectedTags.tags.contains(KatTranslations.fishes)) {
          images.addAll(v);
        }
      },
    );

  return images..shuffle();
}

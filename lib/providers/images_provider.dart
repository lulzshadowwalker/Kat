import 'package:flutter/material.dart';
import 'package:kat/controllers/apis/pexels_api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../controllers/apis/cats_api.dart';
import '../controllers/apis/dogs_api.dart';
import '../controllers/apis/shibes_api.dart';
import '../views/auth/auth_imports.dart';
import 'tags_provider.dart';

part 'images_provider.g.dart';

@riverpod
Future<List<String>> cats(CatsRef ref, BuildContext context) async {
  final cats = await CatsApi.fetchCats(context);
  return cats.map((e) => e.url).toCompactMap.toList();
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

  final providers = {
    KatTranslations.cats: [catsProvider(context)],
    KatTranslations.dogs: [dogsProvider(context), shibesProvider(context)],
    KatTranslations.monkeys: [monkeysProvider(context)],
    KatTranslations.birds: [birdsProvider(context)],
    KatTranslations.fishes: [fishesProvider(context)],
    KatTranslations.clowns: [clownsProvider(context)],
  };

  for (var t in selectedTags.tags) {
    providers[t]?.forEach(
      (p) {
        ref.watch(p).whenData(
              (val) => images.addAll(val),
            );
      },
    );
  }

  return images..shuffle();
}

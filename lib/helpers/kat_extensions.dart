import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../views/auth/auth_imports.dart';

/// capitalizes the given string
/// ..
/// modifies the first letter to uppercase
extension Capitalize on String {
  String get capitalize {
    final firstChar = this[0];

    return replaceFirst(
      firstChar,
      firstChar.toUpperCase(),
    );
  }
}

/// returns a list without the [null] values if any
extension CompactMap<T> on Iterable<T?> {
  Iterable<T> get toCompactMap =>
      map((e) => e).where((e) => e != null).toList().cast();
}

extension RandomIndex<T> on List<T> {
  int get randomIndex => KatHelpers.randomInt(max: length - 1);

  T get random => elementAt(randomIndex);
}

extension NullAwareString on String? {
  int get length => '$this'.length;

  String get maybeAsEmpty => this ?? '';
}

extension StringToImageProvider on String? {
  NetworkImage? get asNetImg => this != null ? NetworkImage(this!) : null;

  AssetImage? get asAssetImg => this != null ? AssetImage(this!) : null;

  CachedNetworkImageProvider? get asCachedNetImg =>
      this != null ? CachedNetworkImageProvider(this!) : null;
}

extension DataToMemProvider on Uint8List? {
  MemoryImage? get asMemImg => this != null ? MemoryImage(this!) : null;
}

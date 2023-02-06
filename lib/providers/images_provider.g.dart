// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$catsHash() => r'251f49497a69c04b380aa70aba17bf2fe356761e';

/// See also [cats].
class CatsProvider extends FutureProvider<List<String>> {
  CatsProvider(
    this.context,
  ) : super(
          (ref) => cats(
            ref,
            context,
          ),
          from: catsProvider,
          name: r'catsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$catsHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is CatsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CatsRef = FutureProviderRef<List<String>>;

/// See also [cats].
final catsProvider = CatsFamily();

class CatsFamily extends Family<AsyncValue<List<String>>> {
  CatsFamily();

  CatsProvider call(
    BuildContext context,
  ) {
    return CatsProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant CatsProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'catsProvider';
}

String _$shibesHash() => r'fa6e62d1ff937815e0371368fbe5bb13a3a92432';

/// See also [shibes].
class ShibesProvider extends FutureProvider<List<String>> {
  ShibesProvider(
    this.context,
  ) : super(
          (ref) => shibes(
            ref,
            context,
          ),
          from: shibesProvider,
          name: r'shibesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shibesHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ShibesProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ShibesRef = FutureProviderRef<List<String>>;

/// See also [shibes].
final shibesProvider = ShibesFamily();

class ShibesFamily extends Family<AsyncValue<List<String>>> {
  ShibesFamily();

  ShibesProvider call(
    BuildContext context,
  ) {
    return ShibesProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant ShibesProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'shibesProvider';
}

String _$birdsHash() => r'02e9e1ca23722c99ffbbc6fda9b2624b8cd0b467';

/// See also [birds].
class BirdsProvider extends FutureProvider<List<String>> {
  BirdsProvider(
    this.context,
  ) : super(
          (ref) => birds(
            ref,
            context,
          ),
          from: birdsProvider,
          name: r'birdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$birdsHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is BirdsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef BirdsRef = FutureProviderRef<List<String>>;

/// See also [birds].
final birdsProvider = BirdsFamily();

class BirdsFamily extends Family<AsyncValue<List<String>>> {
  BirdsFamily();

  BirdsProvider call(
    BuildContext context,
  ) {
    return BirdsProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant BirdsProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'birdsProvider';
}

String _$dogsHash() => r'27dc30de2b4b7c1af024cc6a88fec378daa7a607';

/// See also [dogs].
class DogsProvider extends FutureProvider<List<String>> {
  DogsProvider(
    this.context,
  ) : super(
          (ref) => dogs(
            ref,
            context,
          ),
          from: dogsProvider,
          name: r'dogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$dogsHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is DogsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef DogsRef = FutureProviderRef<List<String>>;

/// See also [dogs].
final dogsProvider = DogsFamily();

class DogsFamily extends Family<AsyncValue<List<String>>> {
  DogsFamily();

  DogsProvider call(
    BuildContext context,
  ) {
    return DogsProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant DogsProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'dogsProvider';
}

String _$monkeysHash() => r'b80d406b0fb54de8257029bfa2c3707b48292c13';

/// See also [monkeys].
class MonkeysProvider extends FutureProvider<List<String>> {
  MonkeysProvider(
    this.context,
  ) : super(
          (ref) => monkeys(
            ref,
            context,
          ),
          from: monkeysProvider,
          name: r'monkeysProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$monkeysHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is MonkeysProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef MonkeysRef = FutureProviderRef<List<String>>;

/// See also [monkeys].
final monkeysProvider = MonkeysFamily();

class MonkeysFamily extends Family<AsyncValue<List<String>>> {
  MonkeysFamily();

  MonkeysProvider call(
    BuildContext context,
  ) {
    return MonkeysProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant MonkeysProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'monkeysProvider';
}

String _$fishesHash() => r'978d3bd6e32801960cf27fa0cdf0bd2fdf801c39';

/// See also [fishes].
class FishesProvider extends FutureProvider<List<String>> {
  FishesProvider(
    this.context,
  ) : super(
          (ref) => fishes(
            ref,
            context,
          ),
          from: fishesProvider,
          name: r'fishesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fishesHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is FishesProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FishesRef = FutureProviderRef<List<String>>;

/// See also [fishes].
final fishesProvider = FishesFamily();

class FishesFamily extends Family<AsyncValue<List<String>>> {
  FishesFamily();

  FishesProvider call(
    BuildContext context,
  ) {
    return FishesProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant FishesProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fishesProvider';
}

String _$clownsHash() => r'b85947042cdbbc6afe88697c8a253e0ec8bb2182';

/// See also [clowns].
class ClownsProvider extends FutureProvider<List<String>> {
  ClownsProvider(
    this.context,
  ) : super(
          (ref) => clowns(
            ref,
            context,
          ),
          from: clownsProvider,
          name: r'clownsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clownsHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ClownsProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ClownsRef = FutureProviderRef<List<String>>;

/// See also [clowns].
final clownsProvider = ClownsFamily();

class ClownsFamily extends Family<AsyncValue<List<String>>> {
  ClownsFamily();

  ClownsProvider call(
    BuildContext context,
  ) {
    return ClownsProvider(
      context,
    );
  }

  @override
  FutureProvider<List<String>> getProviderOverride(
    covariant ClownsProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'clownsProvider';
}

String _$imagesHash() => r'ff3d83447e6f6db622e2404cf4b41c5d1455a059';

/// See also [images].
class ImagesProvider extends Provider<List<String>> {
  ImagesProvider(
    this.context,
  ) : super(
          (ref) => images(
            ref,
            context,
          ),
          from: imagesProvider,
          name: r'imagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imagesHash,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is ImagesProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef ImagesRef = ProviderRef<List<String>>;

/// See also [images].
final imagesProvider = ImagesFamily();

class ImagesFamily extends Family<List<String>> {
  ImagesFamily();

  ImagesProvider call(
    BuildContext context,
  ) {
    return ImagesProvider(
      context,
    );
  }

  @override
  Provider<List<String>> getProviderOverride(
    covariant ImagesProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'imagesProvider';
}

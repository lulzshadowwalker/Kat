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

String _$catsHash() => r'efa363d549daae11635d497e707e300bfc2d7cff';

/// See also [cats].
class CatsProvider extends AutoDisposeFutureProvider<List<Cat>> {
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

typedef CatsRef = AutoDisposeFutureProviderRef<List<Cat>>;

/// See also [cats].
final catsProvider = CatsFamily();

class CatsFamily extends Family<AsyncValue<List<Cat>>> {
  CatsFamily();

  CatsProvider call(
    BuildContext context,
  ) {
    return CatsProvider(
      context,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Cat>> getProviderOverride(
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

String _$shibesHash() => r'8b31ceb35ae0ddacaa924af98dc9a1cbd77b423b';

/// See also [shibes].
class ShibesProvider extends AutoDisposeFutureProvider<List<String>> {
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

typedef ShibesRef = AutoDisposeFutureProviderRef<List<String>>;

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
  AutoDisposeFutureProvider<List<String>> getProviderOverride(
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

String _$birdsHash() => r'5ca196c516b620f70440092a7687f10428286828';

/// See also [birds].
class BirdsProvider extends AutoDisposeFutureProvider<List<String>> {
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

typedef BirdsRef = AutoDisposeFutureProviderRef<List<String>>;

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
  AutoDisposeFutureProvider<List<String>> getProviderOverride(
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

String _$dogsHash() => r'81d5065d866e7bc628c49aa434fb09fdd013cf55';

/// See also [dogs].
class DogsProvider extends AutoDisposeFutureProvider<List<String>> {
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

typedef DogsRef = AutoDisposeFutureProviderRef<List<String>>;

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
  AutoDisposeFutureProvider<List<String>> getProviderOverride(
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

String _$imagesHash() => r'c3563ca74ff872f6641143c0ec4680930ab01dcc';

/// See also [images].
class ImagesProvider extends AutoDisposeProvider<List<String>> {
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

typedef ImagesRef = AutoDisposeProviderRef<List<String>>;

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
  AutoDisposeProvider<List<String>> getProviderOverride(
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

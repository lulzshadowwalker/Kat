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

extension RandomIndex on List {
  int get randomIndex => KatHelpers.randomInt(max: length - 1);
}

extension NullAwareString on String? {
  int get length => '$this'.length;
}

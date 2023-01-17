import 'package:flutter/foundation.dart';

@immutable
class KatSilentException implements Exception {
  const KatSilentException(this.message);

  final String message;
}

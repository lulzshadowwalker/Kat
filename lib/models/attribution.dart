// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'enums/attribute_type.dart';

@immutable
class Attribution {
  final String assetPath;
  final String url;
  final AttributeType attributeType;

  const Attribution({
    required this.assetPath,
    required this.url,
    required this.attributeType,
  });

  Attribution copyWith({
    String? assetPath,
    String? url,
    AttributeType? attributeType,
  }) {
    return Attribution(
      assetPath: assetPath ?? this.assetPath,
      url: url ?? this.url,
      attributeType: attributeType ?? this.attributeType,
    );
  }

  @override
  bool operator ==(covariant Attribution other) {
    if (identical(this, other)) return true;

    return other.assetPath == assetPath &&
        other.url == url &&
        other.attributeType == attributeType;
  }

  @override
  int get hashCode =>
      assetPath.hashCode ^ url.hashCode ^ attributeType.hashCode;

  @override
  String toString() =>
      'Attribution(assetPath: $assetPath, url: $url, attributeType: $attributeType)';
}

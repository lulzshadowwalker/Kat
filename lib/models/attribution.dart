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
}

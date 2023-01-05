// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class NotifConfig {
  final Color color;
  final Widget leading;

  const NotifConfig({
    required this.color,
    required this.leading,
  });

  NotifConfig copyWith({
    Color? color,
    Icon? leading,
  }) {
    return NotifConfig(
      color: color ?? this.color,
      leading: leading ?? this.leading,
    );
  }
}

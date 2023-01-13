import 'package:flutter/foundation.dart';

@immutable
class CatCategory {
  final int? id;
  final String? name;

  const CatCategory({
    this.id,
    this.name,
  });

  CatCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  CatCategory copyWith({
    int? id,
    String? name,
  }) {
    return CatCategory(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CatCategory.fromMap(Map<String, dynamic> map) {
    return CatCategory(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  @override
  String toString() => 'CatCategory(id: $id, name: $name)';

  @override
  bool operator ==(covariant CatCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

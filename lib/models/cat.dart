// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
class Cat {
  final String? sId;
  final List<String>? tags;
  final String? owner;
  final String? createdAt;
  final String? updatedAt;
  final String? url;

  const Cat({
    this.sId,
    this.tags,
    this.owner,
    this.createdAt,
    this.updatedAt,
  }) : url = '$_imageBaseUrl/sId';

  static const String _imageBaseUrl = 'https://cataas.com/cat';

  Cat.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        tags = json['tags'].cast<String>(),
        owner = json['owner'],
        createdAt = json['createdAt'],
        url = '$_imageBaseUrl/${json['_id']}',
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'tags': tags,
        'owner': owner,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'url': url,
      };

  Cat copyWith({
    String? sId,
    List<String>? tags,
    String? owner,
    String? createdAt,
    String? updatedAt,
    String? url,
  }) {
    return Cat(
      sId: sId ?? this.sId,
      tags: tags ?? this.tags,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Cat(sId: $sId, tags: $tags, owner: $owner, createdAt: $createdAt, updatedAt: $updatedAt, url: $url)';
  }

  @override
  bool operator ==(covariant Cat other) {
    if (identical(this, other)) return true;

    return other.sId == sId &&
        listEquals(other.tags, tags) &&
        other.owner == owner &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.url == url;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
        tags.hashCode ^
        owner.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        url.hashCode;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class KatUser {
  final String? username;
  final String? email;
  final String? displayName;
  final String? bio;
  final DateTime? createdOn;
  final String? pfp;
  final Map<String, String>? favs;

  const KatUser(
    this.username,
    this.email,
    this.displayName,
    this.bio,
    this.createdOn,
    this.pfp,
    this.favs,
  );

  KatUser.fromDocSnap(DocumentSnapshot<Map<String, dynamic>> doc)
      : username = doc.data()?['username'],
        email = doc.data()?['email'],
        displayName = doc.data()?['displayName'],
        favs = doc.data() != null
            ? (doc.data()?['favorites'] as Map).map(
                (key, value) => MapEntry(key.toString(), value.toString()),
              )
            : null,
        bio = doc.data()?['bio'],
        createdOn = (doc.data()?['createdOn'] as Timestamp).toDate(),
        pfp = doc.data()?['pfp'];

  KatUser copyWith({
    String? username,
    String? email,
    String? displayName,
    String? bio,
    DateTime? createdOn,
    String? pfp,
    Map<String, String>? favs,
  }) {
    return KatUser(
      username ?? this.username,
      email ?? this.email,
      displayName ?? this.displayName,
      bio ?? this.bio,
      createdOn ?? this.createdOn,
      pfp ?? this.pfp,
      favs ?? this.favs,
    );
  }

  Map<String, dynamic> get toMap => {
        'username': username,
        'email': email,
        'displayName': displayName,
        'bio': bio,
        'createdOn': createdOn,
        'pfp': pfp,
        'favs': favs,
      };

  KatUser.fromMap(Map<String, dynamic> map)
      : username = map['username'],
        displayName = map['displayName'],
        email = map['email'],
        bio = map['bio'],
        createdOn = map['createdOn'],
        pfp = map['pfp'],
        favs = map['favs'] != null
            ? Map<String, String>.from(map['favs'] as Map<String, String>)
            : null;

  String get toJson => json.encode(toMap);

  factory KatUser.fromJson(String source) =>
      KatUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'KatUser(username: $username, email: $email, displayName: $displayName, bio: $bio, createdOn: $createdOn, pfp: $pfp, favs: $favs)';
  }

  @override
  bool operator ==(covariant KatUser other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.displayName == displayName &&
        other.bio == bio &&
        other.createdOn == createdOn &&
        other.pfp == pfp &&
        mapEquals(other.favs, favs);
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        displayName.hashCode ^
        bio.hashCode ^
        createdOn.hashCode ^
        pfp.hashCode ^
        favs.hashCode;
  }
}

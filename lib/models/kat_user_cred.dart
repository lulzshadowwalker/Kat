// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kat/helpers/kat_const.dart';

class KatUserCred {
  /// defaults to [username]
  String? displayName;
  String? id;
  String? username;
  String? email;
  String? password;
  Uint8List? pfpRaw;
  String? pfpUrl;
  String? bio;

  KatUserCred({
    this.displayName,
    this.username,
    this.email,
    this.password,
    this.pfpRaw,
    this.pfpUrl,
    this.bio,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'pfp': pfpUrl,
      'bio': bio,
      'id': id,
    };
  }

  KatUserCred.fromMap(Map<String, dynamic> map)
      : displayName = map['displayName'],
        username = map['username'],
        email = map['email'],
        pfpUrl = map['pfp'],
        id = map['id'],
        bio = map['bio'];

  KatUserCred.fromGoogleAuth(Map<String, dynamic> profile)
      : email = profile[KatConst.gEmail],
        password = '',
        displayName = profile[KatConst.gName],
        pfpUrl = profile[KatConst.gProfilePicture],
        id = profile[KatConst.gUserId];

  String toJson() => json.encode(toMap());

  factory KatUserCred.fromJson(String source) =>
      KatUserCred.fromMap(json.decode(source) as Map<String, dynamic>);
}

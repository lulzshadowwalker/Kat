import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

@immutable
class KatUser {
  final String? username;
  final String? email;
  final String? displayName;
  final String? bio;
  final DateTime? createdOn;
  final String? pfpUrl;

  /// TODO change this to set
  final Map<String, String> favs;

  const KatUser(
    this.username,
    this.email,
    this.displayName,
    this.bio,
    this.createdOn,
    this.pfpUrl,
    this.favs,
  );

  KatUser.fromDocSnap(DocumentSnapshot<Map<String, dynamic>> doc)
      : username = doc.data()?['username'],
        email = doc.data()?['email'],
        displayName = doc.data()?['displayName'],
        favs = doc.data()?['favorites'],
        bio = doc.data()?['bio'],
        createdOn = doc.data()?['createdOn']?.toDate(),
        pfpUrl = doc.data()?['pfpUrl'];
}

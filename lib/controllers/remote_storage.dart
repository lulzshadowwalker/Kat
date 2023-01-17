import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../helpers/kat_helpers.dart';
import 'auth_controller.dart';

class RemoteStorageController {
  RemoteStorageController._internal();
  factory RemoteStorageController() => RemoteStorageController._internal();

  /* STRING CONSTANTS --------------------------------------------------------- */
  /// class name
  static const String _cn = "RemoteStorageController";
  /* -------------------------------------------------------------------------- */
  final _firebaseStorage = FirebaseStorage.instance;
  final _log = KatHelpers.getLogger(_cn);

  Future<String?> upload({
    required BuildContext context,
    required String childName,
    required Uint8List file,
  }) async {
    try {
      final uid = AuthController.userId;
      if (uid == null) throw Exception('User ID is null');
      final String userId = uid;

      final String fileId = const Uuid().v4();

      final ref =
          _firebaseStorage.ref().child(userId).child(childName).child(fileId);

      final snapshot = await ref.putData(file);

      final String downloadUrl = await snapshot.ref.getDownloadURL();

      _log.v('file uploaded successfully');

      return downloadUrl;
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
    return null;
  }
}

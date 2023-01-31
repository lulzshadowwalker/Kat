// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kat/models/kat_user.dart';
import 'package:kat/views/auth/auth_imports.dart';

import '../helpers/typedefs.dart';
import 'remote_storage.dart';

class RemoteDbController {
  RemoteDbController._internal();
  factory RemoteDbController() => RemoteDbController._internal();

  static final _db = FirebaseFirestore.instance;
  static final _log = KatHelpers.getLogger(_cn);
  static final _remoteStorage = RemoteStorageController();

  /* STRING CONST ------------------------------------------------------------- */
  /// class name
  static const String _cn = 'RemoteDbController';
  static const String _cUsers = 'users';
  static const String _aCreatedOn = 'createdOn';
  static const String _aId = 'id';
  static const String _aFavorites = 'favorites';
  /* -------------------------------------------------------------------------- */
  static Future<void> createUserRecord({
    required BuildContext context,
    required UserId uid,
    required WidgetRef ref,
  }) async {
    try {
      var cred = ref.read(credProvider);

      final pfpRaw = cred.pfpRaw;
      if (pfpRaw != null) {
        cred.pfpUrl = await _remoteStorage.upload(
          context: context,
          childName: _cUsers,
          file: pfpRaw,
        );
      }

      await _db.collection(_cUsers).doc(uid).set(
            cred.toMap()
              ..addAll(
                {
                  _aCreatedOn: DateTime.now().toUtc(),
                  _aId: uid,
                  _aFavorites: <String, String>{},
                },
              ),
          );

      _log.v('''
registered new user with details:
  ${cred.toMap()}
''');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Stream<KatUser> get currentUserData {
    final uid = AuthController.userId;

    return _db
        .collection(_cUsers)
        .doc(uid)
        .snapshots()
        .map(KatUser.fromDocSnap);
  }

  static Future<void> toggleFav({
    required BuildContext context,
    required Uint8List image,
    required String id,
  }) async {
    try {
      final uid = AuthController.userId!;

      final favs =
          await currentUserData.firstWhere((u) => true).then((u) => u.favs);

      if (favs!.containsKey(id)) {
        await _db.collection(_cUsers).doc(uid).update(
          {
            _aFavorites: favs..remove(id),
          },
        );

        _log.v('image removed from the user collections favorites');
      } else {
        final url = await _remoteStorage.upload(
          context: context,
          childName: 'favorites',
          file: image,
          fileId: id,
        );

        if (url == null) throw Exception('url is empty');

        await _db.collection(_cUsers).doc(uid).update(
          {
            _aFavorites: favs..addAll({id: url}),
          },
        );

        _log.v('image added to the user collection favorites');
      }
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }
}

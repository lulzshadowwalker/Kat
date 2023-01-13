import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/kat_helpers.dart';
import '../helpers/typedefs.dart';
import '../providers/user_cred_provider.dart';
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
  static const String _aCreatedOn = 'created_on';
  static const String _aId = 'id';
  /* -------------------------------------------------------------------------- */
  Future<void> createUserRecord({
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
                },
              ),
          );

      _log.v('''registered new user with details:
                ${cred.toMap()}
          ''');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }
}

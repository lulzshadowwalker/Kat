// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kat/controllers/notif_controller.dart';
import 'package:kat/models/enums/notif_type.dart';
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
  static const String _aFcmToken = 'fcmToken';
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
              ..['displayName'] = cred.username
              ..addAll(
                {
                  _aCreatedOn: DateTime.now().toUtc(),
                  _aId: uid,
                  _aFavorites: <String, String>{},
                  _aFcmToken: await NotifController.fcmToken,
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

  static Stream<KatUser?> get currentUserData {
    final uid = AuthController.userId;

    return _db
        .collection(_cUsers)
        .doc(uid)
        .snapshots()
        .map((doc) => AuthController.isGuest ? null : KatUser.fromDocSnap(doc));
  }

  static Future<void> toggleFav({
    required BuildContext context,
    required Uint8List image,
    required String id,
  }) async {
    try {
      final uid = AuthController.userId!;

      final favs =
          await currentUserData.firstWhere((u) => true).then((u) => u!.favs);

      if (favs!.containsKey(id)) {
        await _db.collection(_cUsers).doc(uid).update(
          {
            _aFavorites: favs..remove(id),
          },
        );

        _log.v('image removed from the user collections favorites');
      } else {
        addFav(
          context: context,
          image: image,
          id: id,
        );
      }
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> removeFav({
    required BuildContext context,
    required String id,
  }) async {
    try {
      final uid = AuthController.userId!;

      final favs =
          await currentUserData.firstWhere((u) => true).then((u) => u!.favs);

      await _db.collection(_cUsers).doc(uid).update(
        {
          _aFavorites: favs!..remove(id),
        },
      );

      _log.v('image removed from the user collections favorites');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> addFav({
    required BuildContext context,
    required Uint8List image,
    required String id,
  }) async {
    try {
      final uid = AuthController.userId!;

      final favs =
          await currentUserData.firstWhere((u) => true).then((u) => u!.favs);

      final url = await _remoteStorage.upload(
        context: context,
        childName: 'favorites',
        file: image,
        fileId: id,
      );

      if (url == null) throw Exception('url is empty');

      await _db.collection(_cUsers).doc(uid).update(
        {
          _aFavorites: favs!..addAll({id: url}),
        },
      );

      _log.v('image added to the user collection favorites');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> updateAccountDetails({
    required BuildContext context,
    String? username,
    String? email,
    Uint8List? pfp,
  }) async {
    try {
      final uid = AuthController.userId;

      var user = await currentUserData.firstWhere((u) => true);

      /// TODO refactor [RemoteDbController.updateAccountDetails] to only pass the user model
      if (email != null) {
        await AuthController.updateEmail(
          context,
          email,
        );

        user = user!.copyWith(
          email: email,
        );
      }

      if (pfp != null) {
        user = user!.copyWith(
            pfp: await _remoteStorage.upload(
          context: context,
          childName: _cUsers,
          file: pfp,
        ));
      }

      await _db.collection(_cUsers).doc(uid).update(user!.toMap);

      _log.v('updated user account details successfully');

      NotifController.showPopup(
        context: context,
        message: KatTranslations.updatedInfo.tr(),
        type: NotifType.success,
      );
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  /// TODO this is just a temp to update fcm tokens for exisitng users
  static Future<void> registerFcmToken(BuildContext context) async {
    try {
      final token = await NotifController.fcmToken;
      await _db.collection(_cUsers).doc(AuthController.userId).update({
        _aFcmToken: token,
      });

      _log.v('''
FCM token registered in the user record
  $token
''');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }
}

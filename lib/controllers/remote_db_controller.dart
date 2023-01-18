import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'notif_controller.dart';
import 'package:kat/models/enums/notif_type.dart';
import 'package:kat/models/kat_slient_exception.dart';
import 'package:kat/models/kat_user.dart';
import 'package:kat/views/auth/auth_imports.dart';
import 'package:uuid/uuid.dart';
import '../helpers/typedefs.dart';
import 'remote_storage.dart';

class RemoteDbController {
  RemoteDbController._internal();
  factory RemoteDbController() => RemoteDbController._internal();

  static final _db = FirebaseFirestore.instance;
  static final _log = KatHelpers.getLogger(_cn);
  static final _remoteStorage = RemoteStorageController();

  static void _handleGuest(BuildContext context) {
    if (AuthController.isGuest) {
      NotifController.showPopup(
        context: context,
        desc: KatTranslations.needAccount.tr(),
        type: NotifType.tip,
      );

      throw const KatSilentException('''
the requested feature cannot be accessed without an active account
''');
    }
  }

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
                  _aFavorites: [],
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
  }) async {
    try {
      _handleGuest(context);

      final url = await _remoteStorage.upload(
        context: context,
        childName: 'favorites',
        file: image,
      );

      if (url == null) throw Exception('url is empty');

      final uid = AuthController.userId!;
      final favId = const Uuid().v4();

      await _db.collection(_cUsers).doc(uid).update(
        {
          _aFavorites: FieldValue.arrayUnion([{favId: url}]),
        },
      );
      _log.v('image added to the user collection favorites');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/kat_helpers.dart';
import '../helpers/typedefs.dart';
import '../models/enums/notif_type.dart';
import '../models/kat_user_cred.dart';
import '../providers/user_cred_provider.dart';
import '../translations/kat_translations.dart';
import 'notif_controller.dart';
import 'remote_db_controller.dart';

class AuthController {
  AuthController._internal();
  factory AuthController() => AuthController._internal();

  /* STRING CONSTATNS --------------------------------------------------------- */
  /// class name
  static const String _cn = 'Authenticator';
  /* -------------------------------------------------------------------------- */
  static final _auth = FirebaseAuth.instance;
  static final _remoteDb = RemoteDbController();
  static final _log = KatHelpers.getLogger(_cn);

  static UserId? get userId => _user?.uid;
  static User? get _user => _auth.currentUser;
  static Stream<User?> get authState => _auth.authStateChanges();
  static bool get isAuthenticated => _user != null;
  static bool get isGuest => _user?.isAnonymous ?? true;

  static Future<void> guestSignIn(BuildContext context) async {
    try {
      await _auth.signInAnonymously();

      _log.v('Signed-in anonymously');

      NotifController.showPopup(
        context: context,
        desc: KatTranslations.signedInAnon.tr(),
        type: NotifType.success,
      );
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();

      _log.v('Signed-out');

      NotifController.showPopup(
        context: context,
        desc: KatTranslations.signedOut.tr(),
        type: NotifType.warning,
      );
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> emailSignIn(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final cred = ref.read(credProvider);

      await _auth.signInWithEmailAndPassword(
        email: cred.email!,
        password: cred.password!,
      );

      _log.v('Signed-in with email and password');
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> emailSignUp(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final cred = ref.read(credProvider);

      final u = await _auth.createUserWithEmailAndPassword(
        email: cred.email!,
        password: cred.password!,
      );

      _log.v('Signed-up with email and password');

      await _remoteDb.createUserRecord(
        context: context,
        ref: ref,
        uid: u.user!.uid,
      );
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  /// TODO configure google auth to work with web
  static Future<void> googleAuth(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      final googleSignIn = GoogleSignIn(scopes: [
        'profile',
      ]);

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        /// not throwing an exception not to show the user an unnecessary error message
        _log.e('Process terminated by the user');
        return;
      }

      _log.v('Google auth process initiated');

      final googleAuth = await googleUser.authentication;
      _log.v('Obtained user details via Google auth');

      final ouathCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(ouathCredential);
      _log.v('Signed-in with Google auth');

      ref.read(credProvider.notifier).setData(
            KatUserCred.fromGoogleAuth(
              userCredential.additionalUserInfo!.profile!,
            ),
          );

      await _remoteDb.createUserRecord(
        context: context,
        ref: ref,
        uid: userCredential.user!.uid,
      );
    } catch (e) {
      KatHelpers.handleException(context: context, e: e, logger: _log);
    }
  }

  static Future<void> appleAuth() async {
    // TODO implement [appleAuth].
    //  ..
    //  requires an Apple developer account.
    throw UnimplementedError('Apple auth has not been implemnted');
  }
}

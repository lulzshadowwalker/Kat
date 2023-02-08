import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helpers/kat_const.dart';
import '../helpers/typedefs.dart';
import '../models/enums/notif_type.dart';

/// TODO[FIX] why the fock does the locale need a restart to work
class KatTranslations {
  static const String dark = 'dark';
  static const String light = 'light';
  static const String or = 'or';
  static const String username = 'username';
  static const String password = 'password';
  static const String email = 'email';
  static const String signInWithGoogle = 'signInWithGoogle';
  static const String signUpWithGoogle = 'signUpWithGoogle';
  static const String enterValidEmail = 'enterValidEmail';
  static const String pickStrongPassword = 'pickStrongPassword';
  static const String longerUsername = 'longerUsername';
  static const String alreadyHaveAnAccount = 'alreadyHaveAnAccount';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String dontHaveAnAccount = 'dontHaveAnAccount';
  static const String goBackToHome = 'goBackToHome';
  static const String signedInAnon = 'signedInAnon';
  static const String unknownError = 'unknownError';
  static const String pageDoesNotExist = 'pageDoesNotExist';
  static const String networkRequestFailed = 'network-request-failed';
  static const String cancel = 'cancel';
  static const String camera = 'camera';
  static const String gallery = 'gallery';
  static const String continueAsGuest = 'continueAsGuest';
  static const String signedOut = 'signedOut';
  static const String gif = 'gif';
  static const String saySomething = 'saySomething';
  static const String goodMorning = 'goodMorning';
  static const String howAreYou = 'howAreYou';
  static const String onMyPuter = 'onMyPuter';
  static const String iWouldLikeSomeCoffee = 'iWouldLikeSomeCoffee';
  static const String addToFavs = 'addToFavs';
  static const String removeFromFavs = 'removeFromFavs';
  static const String share = 'share';
  static const String download = 'download';
  static const String tags = 'tags';
  static const String imageDownloaded = 'imageDownloaded';
  static const String cats = 'cats';
  static const String dogs = 'dogs';
  static const String birds = 'birds';
  static const String fishes = 'fishes';
  static const String monkeys = 'monkeys';
  static const String clowns = 'clowns';
  static const String needAccount = 'needAccount';
  static const String sry = 'sry';
  static const String inDevelopment = 'inDevelopment';
  static const String tap3TimesToSignOut = 'tap3TimesToSignOut';
  static const String all = 'all';
  static const String appSettings = 'appSettings';
  static const String language = 'language';
  static const String darkMode = 'darkMode';
  static const String devNotice = 'devNotice';
  static const String attributions = 'attributions';
  static const String signOut = 'signOut';
  static const String createAnAccount = 'createAnAccount';
  static const String settings = 'settings';
  static const String viewProfile = 'viewProfile';
  static const String guest = 'guest';
  static const String resetPassword = 'resetPassword';
  static const String passwordResetEmailSent = 'passwordResetEmailSent';
  static const String account = 'account';
  static final String oops = NotifType.oops.name;
  static final String warning = NotifType.warning.name;
  static final String tip = NotifType.tip.name;
  static final String success = NotifType.success.name;
  static const String update = 'update';
  static const String passwordToContinue = 'passwordToContinue';
  static const String profile = 'profile';
  static const String updatedInfo = 'updatedInfo';
  static const String signupToSaveCreations = 'signupToSaveCreations';
  static const String startBySavingSomeCringe = 'startBySavingSomeCringe';

  static LangCode? currentLangCode(BuildContext context) =>
      EasyLocalization.of(context)?.locale.languageCode;

  static List<Locale> get supportedLocales => const [
        Locale(KatConst.en),
        Locale(KatConst.ru),
      ];
}

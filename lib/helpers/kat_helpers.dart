// ignore_for_file: use_build_context_synchronously

import 'dart:io' show Platform, SocketException;
import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/auth_controller.dart';
import '../models/kat_slient_exception.dart';
import 'package:logger/logger.dart';
import 'package:screenshot/screenshot.dart';

import '../controllers/notif_controller.dart';
import '../models/enums/notif_type.dart';
import '../translations/kat_translations.dart';
import '../views/shared/kat_image_picker/kat_image_picker.dart';
import 'kat_const.dart';
import 'kat_log_printer.dart';

class KatHelpers {
  /* STRING CONSTANTS --------------------------------------------------------- */
  /// class name
  static const String _cn = 'KatHelpers';
  /* -------------------------------------------------------------------------- */
  static final _log = getLogger(_cn);

  /// Instantiate a [Logger] instance with the neseccary boilerplate code
  static Logger getLogger(String className) => Logger(
        printer: KatLogPrinter(className),
      );

  static void _handleSocketException(
    BuildContext context,
    Logger logger,
  ) {
    logger.e('SocketExcepetion, check internet connection.');

    NotifController.showPopup(
      context: context,
      desc: KatTranslations.networkRequestFailed.tr(),
      type: NotifType.oops,
    );
  }

  static void _handleUnkownError(
    BuildContext context,
    Object error,
    Logger logger,
  ) {
    logger.e(error.toString());

    NotifController.showPopup(
      context: context,
      desc: KatTranslations.unknownError.tr(),
      type: NotifType.oops,
    );
  }

  static void _handleFirebaseAuthException(
    BuildContext context,
    FirebaseAuthException e,
  ) {
    _log.e('${e.message}');

    NotifController.showPopup(
      context: context,
      desc: e.code.tr(),
      type: NotifType.oops,
    );
  }

  static void handleException({
    required BuildContext context,
    required Object e,
    required Logger logger,
  }) {
    if (e is SocketException) {
      _handleSocketException(context, logger);
    } else if (e is FirebaseAuthException) {
      _handleFirebaseAuthException(context, e);
    } else if (e is KatSilentException) {
      logger.e(e.message);
    } else {
      _handleUnkownError(context, e, logger);
    }
  }

  ///returns [true] if the application is currently running on a mobile platform
  static bool get isAndroidOrIos =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static bool get isIos => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  /// image picking utility for android/iOS/web
  /// ..
  /// mobile, gallery / camera
  /// web, gallery
  static Future<Uint8List?> pickImage(BuildContext context) async {
    try {
      final aborted =
          Exception('Image picking proccess terminated by the user');

      ImageSource? imageSource = ImageSource.gallery;

      if (!kIsWeb && KatHelpers.isAndroidOrIos) {
        imageSource = await showModalBottomSheet(
          context: context,
          builder: (_) => const KatImagePicker(),
          backgroundColor: Colors.transparent,
          constraints: const BoxConstraints(maxWidth: 500),
        );

        if (imageSource == null) {
          throw aborted;
        }
      }

      final image = await ImagePicker().pickImage(source: imageSource);

      if (image == null) {
        throw aborted;
      }

      return image.readAsBytes();
    } catch (e) {
      _log.e(e.toString());
      return null;
    }
  }

  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  // returns a random int between min (default 0) and max
  static int randomInt({
    required int max,
    int min = 0,
  }) =>
      math.Random().nextInt(max) + min;

  /// returns the subjective screen width depending on the orientation of the device
  static double screenWidth(BuildContext context) => isPortrait(context)
      ? math.min(
          screenSize(context).width,
          screenSize(context).height,
        )
      : math.max(
          screenSize(context).width,
          screenSize(context).height,
        );

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// returns [true] if the screen width is less than or equal to the mobile breakpoint
  static bool isMobileBp(BuildContext context) =>
      screenWidth(context) <= KatConst.mobileBreakpoint;

  /// returns [true] if the screen width is less than or equal to the tablet breakpoint
  static bool isTabletBp(BuildContext context) =>
      screenWidth(context) <= KatConst.tabletBreakpoint && !isMobileBp(context);

  /// returns [true] if the screen width larger than the tablet breakpoint
  static bool isDesktopBp(BuildContext context) =>
      screenWidth(context) > KatConst.tabletBreakpoint;

  /// captures a widget as an image and saves it to the gallery
  static Future<String?> downloadImage({
    required BuildContext context,
    required Widget widget,
  }) async {
    /// TODO better permissions handling
    try {
      final image = await ScreenshotController().captureFromWidget(widget);

      final res = await ImageGallerySaver.saveImage(
        image,
        name: 'aboba.png',
      ) as Map;

      NotifController.showPopup(
        context: context,
        desc: KatTranslations.imageDownloaded.tr(),
        type: NotifType.success,
      );

      return res['filePath'].toString();
    } catch (e) {
      handleException(context: context, e: e, logger: _log);
      return null;
    }
  }

  static bool handleGuest(BuildContext context) {
    if (AuthController.isGuest) {
      NotifController.showPopup(
        context: context,
        desc: KatTranslations.needAccount.tr(),
        type: NotifType.tip,
      );

      _log.v('''
the requested feature cannot be accessed without an active account
''');
    }

    return AuthController.isGuest;
  }
}

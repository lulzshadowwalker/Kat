import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:lottie/lottie.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../helpers/kat_anims.dart';
import '../helpers/kat_helpers.dart';
import '../models/enums/notif_type.dart';
import '../models/notif_config.dart';
import '../theme/kat_colors.dart';
import '../translations/kat_translations.dart';

/// ! must be a top level function [read more](https://firebase.flutter.dev/docs/messaging/usage#:~:text=Handling%20messages%20whilst,which%20requires%20initialization)
Future<void> _handleFcmBackgroundMessage(RemoteMessage message) async {
  final RemoteNotification? notif = message.notification;
  if (notif != null) {
    NotifController().show(
      id: DateTime.now().second,
      title: notif.title ?? 'Улыбка 🤭',
      body: notif.body ?? 'Сегодня будет хороший день, я чувствую это',
    );
  }
}

class NotifController {
  NotifController._internal();
  factory NotifController() => NotifController._internal();

  /// class name
  static const String _cn = 'NotifController';
  static final _log = KatHelpers.getLogger(_cn);

  static final _notifConfigs = <NotifType, NotifConfig>{
    NotifType.success: NotifConfig(
      color: KatColors.purple,
      leading: LottieBuilder.asset(KatAnims.success, repeat: false),
    ),
    NotifType.warning: NotifConfig(
      color: KatColors.yellow,
      leading: LottieBuilder.asset(KatAnims.warning, repeat: false),
    ),
    NotifType.oops: NotifConfig(
      color: KatColors.red,
      leading: LottieBuilder.asset(KatAnims.oops, repeat: false),
    ),
    NotifType.tip: NotifConfig(
      color: KatColors.blue,
      leading: LottieBuilder.asset(KatAnims.tip, repeat: false),
    ),
  };

  static NotifConfig _getNotifConfig(NotifType type) =>
      _notifConfigs[type] ?? _notifConfigs[NotifType.tip]!;

  static void _showMobilePopop({
    required BuildContext context,
    required String title,
    required String desc,
    required NotifType type,
    Duration duration = const Duration(milliseconds: 3000),
  }) {
    ScaffoldMessenger.maybeOf(context)?.removeCurrentSnackBar();

    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: _getNotifConfig(type).color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 56,
        ),
        content: ListTile(
          leading: SizedBox(
            height: double.infinity,
            child: _getNotifConfig(type).leading,
          ),
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: KatColors.white),
          ),
          subtitle: Text(
            desc,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: KatColors.white.withOpacity(0.65)),
          ),
        ),
      ),
    );
  }

  /// shows an adaptive platform appropriate popup
  static void showPopup({
    required BuildContext context,
    String? title,
    required String message,
    required NotifType type,
  }) {
    title ??= type.name.tr();
    const duration = Duration(milliseconds: 3500);

    switch (type) {
      case NotifType.success:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: message,
                type: type,
                duration: duration,
              )
            : ElegantNotification.success(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.25,
                toastDuration: duration,
                description: Text(message),
              ).show(context);
        break;
      case NotifType.oops:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: message,
                type: type,
                duration: duration,
              )
            : ElegantNotification.error(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.3,
                toastDuration: duration,
                description: Text(message),
              ).show(context);
        break;
      case NotifType.warning:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: message,
                type: type,
                duration: duration,
              )
            : ElegantNotification(
                background: KatColors.same(context),
                icon: _getNotifConfig(type).leading,
                progressIndicatorColor: _getNotifConfig(type).color,
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.3,
                toastDuration: duration,
                description: Text(message),
              ).show(context);
        break;
      case NotifType.tip:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: message,
                type: type,
                duration: duration,
              )
            : ElegantNotification.info(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.3,
                toastDuration: duration,
                description: Text(message),
              ).show(context);
        break;
    }

    _log.v('''
Popup shown with details
  type: ${type.name},
  title: $title, 
  description: $message
''');
  }

  /// shows a popup with a messaging indicating that the requested feature is in-development
  static void showInDevPopup(BuildContext context) {
    NotifController.showPopup(
      context: context,
      title: KatTranslations.sry.tr(),
      message: KatTranslations.inDevelopment.tr(),
      type: NotifType.tip,
    );
  }

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final _notifDetails = NotificationDetails(
    //
    android: AndroidNotificationDetails(
      'main_channel',
      'General',
      importance: Importance.max,
      priority: Priority.max,
      color: KatColors.purple,
    ),

    //
    iOS: const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );

  Future<void> init() async {
    try {
      if (!KatHelpers.isAndroidOrIos) return;

      if (Platform.isAndroid) {
        final isGranted = await _flutterLocalNotificationsPlugin
                .resolvePlatformSpecificImplementation<
                    AndroidFlutterLocalNotificationsPlugin>()
                ?.requestPermission() ??
            false;

        if (!isGranted) {
          /// hecker man
          await show(
            id: 372,
            title: 'гони преколы',
            body: 'я не знаю, что мне делать со своей кринге энерджи..',
          );
        }
      } else if (Platform.isIOS) {
        await _flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            );
      }

      tz.initializeTimeZones();
      final localTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(localTimeZone));

      const initializationSettingsAndroid = AndroidInitializationSettings(
        '@drawable/ic_notification',
      );

      const initializationSettingsIOS = DarwinInitializationSettings();

      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

      await _initCloudMessaging();

      _log.v('[NotifController] has been initialized');
    } catch (e) {
      _log.e(e.toString());
    }
  }

  Future<void> _initPeriodicNotifs() async {
    const templates = {};
    final i = DateTime.now().day % templates.length;

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      6969,
      templates.keys.elementAt(i),
      templates.values.elementAt(i),
      RepeatInterval.daily,
      _notifDetails,
    );
  }

  Future<void> show({
    required int id,
    required String title,
    required String body,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _notifDetails,
    );

    _log.v('''
local push notification has been shown
  title: $title
  body: $body
''');
  }

  static const _androidNotifDetails = AndroidNotificationDetails(
    'main_channel',
    'General',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const _iosNotifDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  Future<void> showScheduled({
    required int id,
    required String title,
    required String body,
    required tz.TZDateTime scheduledTime,
  }) async {
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledTime,
      const NotificationDetails(
        //
        android: _androidNotifDetails,

        //
        iOS: _iosNotifDetails,
      ),

      //
      matchDateTimeComponents: DateTimeComponents.time,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    _log.v('''
local push notification has been scheduled to be shown 
  @ ${scheduledTime.toString()} 
    title: $title
    body: $body
''');
  }

  tz.TZDateTime scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(seconds: 5))
        : scheduledTime;
  }

  tz.TZDateTime scheduleWeekly(Time time) {
    final now = tz.TZDateTime.now(tz.local);

    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );

    return scheduledTime.isBefore(now)
        ? scheduledTime.add(const Duration(days: 7))
        : scheduledTime;
  }

  Future<void> cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();

    _log.v('all notifications have been cancelled');
  }

  Future<void> _initCloudMessaging() async {
    if (KatHelpers.isIos) {
      final settings = await FirebaseMessaging.instance.requestPermission();

      _log.v(
          'user\'s notifications permission status: ${settings.authorizationStatus}');
    }

    FirebaseMessaging.onMessage.listen(
      (message) {
        final RemoteNotification? notif = message.notification;
        if (notif != null) {
          show(
            id: DateTime.now().second,
            title: notif.title ?? 'Улыбка 🤭',
            body: notif.body ?? 'Сегодня будет хороший день, я чувствую это',
          );
        }
      },
    );

    FirebaseMessaging.onBackgroundMessage(_handleFcmBackgroundMessage);

    _log.v('Firebase Cloud-Messaging has been initialized');
  }
}

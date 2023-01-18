import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import '../helpers/kat_anim.dart';
import '../helpers/kat_helpers.dart';
import '../models/notif_config.dart';
import '../theme/kat_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import '../models/enums/notif_type.dart';
import '../translations/kat_translations.dart';

class NotifController {
  NotifController._internal();
  factory NotifController() => NotifController._internal();

  /// TODO handle push notif ids programmatically

  /// class name
  static const String _cn = 'NotifController';
  static final _log = KatHelpers.getLogger(_cn);

  static final _notifConfigs = <NotifType, NotifConfig>{
    NotifType.success: NotifConfig(
      color: KatColors.purple,
      leading: LottieBuilder.asset(KatAnim.success, repeat: false),
    ),
    NotifType.warning: NotifConfig(
      color: KatColors.yellow,
      leading: LottieBuilder.asset(KatAnim.warning, repeat: false),
    ),
    NotifType.oops: NotifConfig(
      color: KatColors.red,
      leading: LottieBuilder.asset(KatAnim.oops, repeat: false),
    ),
    NotifType.tip: NotifConfig(
      color: KatColors.blue,
      leading: LottieBuilder.asset(KatAnim.tip, repeat: false),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        backgroundColor: _getNotifConfig(type).color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
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
                .bodyText2
                ?.copyWith(color: KatColors.white),
          ),
          subtitle: Text(
            desc,
            style: Theme.of(context)
                .textTheme
                .bodyText2
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
    required String desc,
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
                desc: desc,
                type: type,
                duration: duration,
              )
            : ElegantNotification.success(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.25,
                toastDuration: duration,
                description: Text(desc),
              ).show(context);
        break;
      case NotifType.oops:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: desc,
                type: type,
                duration: duration,
              )
            : ElegantNotification.error(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.3,
                toastDuration: duration,
                description: Text(desc),
              ).show(context);
        break;
      case NotifType.warning:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: desc,
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
                description: Text(desc),
              ).show(context);
        break;
      case NotifType.tip:
        KatHelpers.isAndroidOrIos
            ? _showMobilePopop(
                context: context,
                title: title,
                desc: desc,
                type: type,
                duration: duration,
              )
            : ElegantNotification.info(
                background: KatColors.same(context),
                notificationPosition: NotificationPosition.bottomRight,
                title: Text(title),
                width: MediaQuery.of(context).size.width * 0.3,
                toastDuration: duration,
                description: Text(desc),
              ).show(context);
        break;
    }

    _log.v('''
Popup shown with details
  type: ${type.name},
  title: $title, 
  description: $desc
''');
  }

  /// shows a popup with a messaging indicating that the requested feature is in-development
  static void showInDevPopup(BuildContext context) {
    NotifController.showPopup(
      context: context,
      title: KatTranslations.sry.tr(),
      desc: KatTranslations.inDevelopment.tr(),
      type: NotifType.tip,
    );
  }

  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    try {
      /// TODO there are better ways to handle scheduled notifications
      ///  https://pub.dev/documentation/flutter_local_notifications/latest/flutter_local_notifications/FlutterLocalNotificationsPlugin-class.html

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

      _log.v('[NotifController] has been initialized');

      showScheduled(
        id: 6969,
        title: 'гони преколы',
        body: 'я не знаю, что мне делать со своей кринге энерджи..',
        scheduledTime: scheduleDaily(
          const Time(9, 00),
        ),
      );

      showScheduled(
        id: 420,
        title: 'Улыбка',
        body: 'Сегодня будет хороший день, я чувствую это',
        scheduledTime: scheduleWeekly(
          const Time(6, 00),
        ),
      );
    } catch (e) {
      _log.e(e.toString());
    }
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
      NotificationDetails(
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
      ),
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
}

import 'package:easy_localization/easy_localization.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import '../helpers/kat_anim.dart';
import '../helpers/kat_helpers.dart';
import '../models/notif_config.dart';
import '../theme/kat_colors.dart';
import 'package:lottie/lottie.dart';

import '../models/enums/notif_type.dart';
import '../translations/kat_translations.dart';

class NotifController {
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

    /// TODO maybe use the same colors of [ElegantNotif] for mobile snackbars
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

  static void showInDevPopup(BuildContext context) {
    NotifController.showPopup(
      context: context,
      title: KatTranslations.sry.tr(),
      desc: KatTranslations.inDevelopment.tr(),
      type: NotifType.tip,
    );
  }
}

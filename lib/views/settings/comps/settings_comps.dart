import 'dart:typed_data';

import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:go_router/go_router.dart';
import '../../../controllers/remote_db_controller.dart';
import '../../../providers/user_provider.dart';
import '../../../theme/kat_theme.dart';
import '../../attributions/attributions.dart';
import '../../auth/auth_imports.dart';
import '../../profile/comps/profile_comps.dart';
import '../../shared/kat_single_child_scroll_view/kat_single_child_scroll_view.dart';
import '../../shared/kat_unfocusable_wrapper/kat_unfocusable_wrapper.dart';
import '../../shared/text_fields/kat_email_field.dart';
import '../../shared/text_fields/kat_password_field.dart';

import '../../../helpers/kat_const.dart';
import '../../../providers/theme_mode_provider.dart';
import '../../../router/kat_routes.dart';
import '../../shared/kat_app_bar/kat_app_bar.dart';
import '../../shared/kat_circle_image_avatar/kat_circle_image_avatar.dart';

part './settings_section.dart';
part '../settings.dart';
part 'account_settings.dart';
part 'app_settings.dart';
part 'developer_notice.dart';
part 'settings_option.dart';
part 'settings_profile_header.dart';

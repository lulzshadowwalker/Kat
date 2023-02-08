import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';

import '../../../../controllers/remote_db_controller.dart';
import '../../../../helpers/kat_anims.dart';
import '../../../../providers/user_provider.dart';
import '../../../auth/auth_imports.dart';
import '../../kat_animated_scale/kat_animated_scale.dart';
import '../../kat_fullscreen/kat_fullscreen.dart';

part '../kat_image_card.dart';
part 'kat_mobile_image_card.dart';
part 'kat_web_image_card.dart';
part 'modified_image.dart';

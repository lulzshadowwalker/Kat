import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kat/controllers/selected_tags_notifier.dart';
import 'package:kat/helpers/typedefs.dart';
import 'package:kat/providers/cat_tags_provider.dart';
import 'package:kat/providers/cats_provider.dart';
import 'package:kat/theme/kat_theme.dart';
import 'package:kat/views/oops/oops.dart';
import 'package:kat/views/shared/kat_check_box_list_tile/kat_check_box_list_tile.dart';
import 'package:kat/views/shared/kat_constrained_box/kat_constrained_box.dart';
import 'package:kat/views/shared/kat_form_field_base/kat_form_field_base.dart';
import 'package:kat/views/shared/loading/loading.dart';
import 'package:pie_menu/pie_menu.dart';

import '../../../models/cat.dart';
import '../../../providers/word_provider.dart';
import '../../auth/auth_imports.dart';
import '../../shared/kat_animated_scale/kat_animated_scale.dart';

part '../home.dart';
part 'home_card.dart';
part 'home_search_bar.dart';
part 'mobile_home_card.dart';
part 'tags_sheet.dart';
part 'web_home_card.dart';

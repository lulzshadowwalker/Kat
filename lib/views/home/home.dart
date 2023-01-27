import 'package:flutter/material.dart';
import 'package:kat/views/feed/comp/feed_comp.dart';
import 'package:kat/views/profile/profile.dart';
import 'package:kat/views/settings/settings.dart';
import 'package:kat/views/social/social.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../auth/auth_imports.dart';

class Home extends HookWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        Feed(),
        Social(),
        Profile(),
        Settings(),
      ],
      backgroundColor: KatColors.purple,
      controller: PersistentTabController(initialIndex: 0),
      items: [
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.houseChimneyWindow),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          title: 'Home',
          iconSize: 24,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.userGroup),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          title: 'Social',
          iconSize: 24,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.solidUser),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          title: 'Profile',
          iconSize: 24,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.gear),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          title: 'Settings',
          iconSize: 24,
        ),
      ],
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      navBarHeight: kBottomNavigationBarHeight + 8,
      padding: const NavBarPadding.fromLTRB(null, 24, null, 0),
      navBarStyle: NavBarStyle.style12,
    );
  }
}

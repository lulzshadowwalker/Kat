import 'package:flutter/material.dart';
import '../feed/comp/feed_comp.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../auth/auth_imports.dart';
import '../profile/comps/profile_comps.dart';
import '../settings/comps/settings_comps.dart';

class Home extends HookWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      // ignore: prefer_const_literals_to_create_immutables
      screens: [
        const Feed(),
        const Profile(),
        // ignore: prefer_const_constructors
        Settings(),
      ],
      backgroundColor: KatColors.purple,
      controller: PersistentTabController(initialIndex: 0),
      items: [
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.houseChimneyWindow),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          iconSize: 24,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.solidUser),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          iconSize: 24,
        ),
        PersistentBottomNavBarItem(
          icon: const FaIcon(FontAwesomeIcons.gear),
          activeColorPrimary: KatColors.gold,
          inactiveColorPrimary: KatColors.pink,
          iconSize: 24,
        ),
      ],
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      navBarHeight: kBottomNavigationBarHeight + 24,
      padding: const NavBarPadding.fromLTRB(null, 24, null, 16),
      navBarStyle: NavBarStyle.style12,
    );
  }
}

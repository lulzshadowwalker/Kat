part of './home_comp.dart';

class _KatBottomNavBar extends StatelessWidget {
  const _KatBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoltenBottomNavigationBar(
      barHeight: kBottomNavigationBarHeight * 2,
      barColor: KatColors.primary(context),
      domeCircleColor: KatColors.primaryContainer(context),
      domeHeight: 10,
      domeCircleSize: 65,
      borderRaduis: const BorderRadius.vertical(
        top: Radius.circular(25),
      ),
      tabs: [
        MoltenTab(
          icon: const Icon(
            FontAwesomeIcons.userGroup,
          ),
          unselectedColor: KatColors.primaryContainer(context),
        ),
        MoltenTab(
          icon: const Icon(
            FontAwesomeIcons.houseChimneyWindow,
          ),
          selectedColor: KatColors.primary(context),
        ),
        MoltenTab(
          icon: GestureDetector(
            onLongPress: () => AuthController.signOut(context),
            child: const Icon(
              FontAwesomeIcons.gear,
            ),
          ),
          unselectedColor: KatColors.primaryContainer(context),
        )
      ],
      selectedIndex: 1,
      onTabChange: (i) {
        if (i == 1) return;

        final storageKey = 'bottomBarTemp$i';

        final val = GetStorage().read(storageKey);
        if (val == null) {
          NotifController.showInDevPopup(context);
          GetStorage().write(storageKey, true);
          return;
        }

        if (val == 2) {
          NotifController.showPopup(
            context: context,
            desc: KatTranslations.holdToSignOut.tr(),
            type: NotifType.tip,
          );
        }
      },
    );
  }
}

part of './home_comp.dart';

class _KatBottomNavBar extends HookWidget {
  const _KatBottomNavBar({
    Key? key,
  }) : super(key: key);

  static const String _storageKey = 'aboba';

  @override
  Widget build(BuildContext context) {
    final settingsTapCount = useState(0);
    final isMounted = useIsMounted();

    return BottomBarInspiredOutside(
      items: const [
        TabItem(
          icon: FontAwesomeIcons.userGroup,
        ),
        TabItem(
          icon: FontAwesomeIcons.houseChimneyWindow,
        ),
        TabItem(
          icon: FontAwesomeIcons.gear,
        )
      ],
      backgroundColor: KatColors.primary(context),
      color: KatColors.primaryContainer(context),
      colorSelected: KatColors.primary(context),
      indexSelected: 1,
      fixed: true,
      fixedIndex: 1,
      onTap: (int i) async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();

        final isFirstTime = GetStorage().read(_storageKey) ?? true;

        if (isFirstTime) {
          NotifController.showInDevPopup(context);
          GetStorage().write(_storageKey, false);
          return;
        }

        NotifController.showPopup(
          context: context,
          desc: KatTranslations.tap3TimesToSignOut.tr(),
          type: NotifType.tip,
        );

        if (i == 2 && ++settingsTapCount.value == 3) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          AuthController.signOut(context);
          return;
        }
        
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            if (isMounted()) {
              settingsTapCount.value = 0;
            }
          },
        );
      },
      animated: false,
      itemStyle: ItemStyle.circle,
      chipStyle: ChipStyle(
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        background: KatColors.primaryContainer(context),
        color: KatColors.primary(context),
      ),
      iconSize: 24,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(50),
      ),
      sizeInside: 64,
      top: -48,
      radius: 15,
    );
  }
}

part of './comps/profile_comps.dart';

class Profile extends HookConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;
    final favs = user?.favs ?? {};
    final isPieMenuInactive = useState(false);

    return PieCanvas(
      theme: KatTheme.pieTheme(context),
      onMenuToggle: (active) => isPieMenuInactive.value = active,
      child: Scaffold(
        extendBody: true,
        appBar: KatAppBar(
          title:
              user?.displayName ?? user?.username ?? KatTranslations.guest.tr(),
          actions: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: KatColors.purple,
                ),
                shape: BoxShape.circle,
              ),
              child: KatCircleImageAvatar(
                image: user?.pfp.asCachedNetImg,
                radius: 80,
              ),
            )
          ],
        ),
        body: user == null
            ? const _ProfileCreateAccount()
            : user.favs == null || user.favs!.isEmpty
                ? const _ProfileSaveCringe()
                : KatGridView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    primary: false,
                    physics: isPieMenuInactive.value
                        ? const NeverScrollableScrollPhysics()
                        : const ClampingScrollPhysics(),
                    children: List.generate(
                      favs.length,
                      (index) => KatImageCard(
                        index: index,
                        url: favs.values.elementAt(index),
                        isFav: true,
                        imageId: favs.keys.elementAt(index),
                      ),
                    ),
                  ),
      ),
    );
  }
}

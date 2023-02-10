part of './settings_comps.dart';

class _SettingsProfileHeader extends ConsumerWidget {
  const _SettingsProfileHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
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
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  /// TODO implement an extension to return null if the string is empty
                  user?.displayName ??
                      user?.username ??
                      KatTranslations.guest.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: KatColors.muted),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    if (AuthController.isGuest) {
                      AuthController.signOut(context);
                      return;
                    }

                    KatHelpers.push(context, const Profile());
                  },
                  child: Text(
                    AuthController.isGuest
                        ? KatTranslations.createAnAccount
                        : KatTranslations.viewProfile,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AuthController.isGuest
                              ? KatColors.muted
                              : KatColors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                  ).tr(),
                )
              ],
            ),
          ),
          if (!AuthController.isGuest)
            Bounceable(
              onTap: () => KatHelpers.push(
                context,
                _AccountSettings(),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: KatColors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 48,
                height: 48,
                child: Icon(
                  FontAwesomeIcons.penToSquare,
                  color: KatColors.purple,
                ),
              ),
            )
        ],
      ),
    );
  }
}

part of './profile_comps.dart';

class _ProfileCreateAccount extends StatelessWidget {
  const _ProfileCreateAccount();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ProfileAnim(),
          KatRichTextButton(
            text: '${KatTranslations.signupToSaveCreations.tr()}\n',
            textCTA: KatTranslations.createAnAccount.tr(),
            onTap: () => AuthController.signOut(context),
          )
        ],
      ),
    );
  }
}

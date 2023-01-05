import 'package:flutter/cupertino.dart';
import '../../auth/auth_imports.dart';
import '../../../models/enums/auth_type.dart';

class GoogleAuthButton extends ConsumerWidget {
  const GoogleAuthButton({Key? key, required this.authType}) : super(key: key);

  final AuthType authType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KatExpandedElevatedButton(
      onPressed: () async => await AuthController.googleAuth(context, ref),
      leading: FaIcon(
        FontAwesomeIcons.google,
        color: KatColors.primaryContainer(context),
        size: 16,
      ),
      backgroundColor: KatColors.primary(context),
      foregroundColor: KatColors.primaryContainer(context),
      text: authType == AuthType.signIn
          ? KatTranslations.signInWithGoogle.tr()
          : KatTranslations.signUpWithGoogle.tr(),
    );
  }
}

import 'package:flutter/material.dart';
import '../auth_imports.dart';

class GuestAuthTextButton extends StatelessWidget {
  const GuestAuthTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async => await AuthController.guestSignIn(context),
      child: Text(
        KatTranslations.continueAsGuest.tr(),
        style: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(color: KatColors.muted),
      ),
    );
  }
}

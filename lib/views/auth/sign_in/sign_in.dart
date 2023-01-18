import 'package:go_router/go_router.dart';
import 'package:kat/views/shared/kat_single_child_scroll_view/kat_single_child_scroll_view.dart';
import '../../../controllers/notif_controller.dart';
import '../../shared/kat_constrained_box/kat_constrained_box.dart';
import '../../../hooks/use_invalidate_cred.dart';
import '../../../models/enums/auth_type.dart';
import '../../../router/kat_routes.dart';
import '../components/guest_auth_text_button.dart';

import '../../shared/text_fields/kat_email_field.dart';
import '../../shared/text_fields/kat_password_field.dart';
import '../auth_imports.dart';
import 'package:flutter/material.dart';

class SignIn extends HookConsumerWidget {
  SignIn({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInvalidateCred(ref);
    useEffect(() {
      NotifController().init();
      return null;
    }, const []);

    /// TODO refactor to [KatPageBase]
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Center(
          child: KatConstrainedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: KatSingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),

                      const KatEmailField(),
                      const KatPasswordField(),
                      const SizedBox(height: 25),

                      // sign in button
                      KatExpandedElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState == null ||
                              !_formKey.currentState!.validate()) return;

                          _formKey.currentState!.save();
                          await AuthController.emailSignIn(context, ref);
                        },
                        text: KatTranslations.signIn.tr(),
                      ),

                      //
                      KatDivider(
                        child: Text(
                          KatTranslations.or.tr(),
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: KatColors.primary(context),
                                  ),
                        ),
                      ),

                      //
                      const GoogleAuthButton(authType: AuthType.signIn),
                      const GuestAuthTextButton(),
                      const Spacer(),

                      //
                      KatRichTextButton(
                        text: KatTranslations.dontHaveAnAccount.tr(),
                        textCTA: KatTranslations.signUp.tr(),
                        onTap: () => context.replaceNamed(KatRoutes.signUp),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

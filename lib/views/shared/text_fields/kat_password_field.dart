import 'package:flutter/material.dart';

import '../../../helpers/kat_extensions.dart';
import 'text_feild_imports.dart';

class KatPasswordField extends HookConsumerWidget {
  const KatPasswordField({
    this.hintText,
    Key? key,
  }) : super(key: key);

  final String? hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPassObscure = useState(true);
    bool isObscure = isPassObscure.value;

    return KatFormField(
      validator: (val) =>
          val.length >= 8 ? null : KatTranslations.pickStrongPassword.tr(),
      onSaved: (val) => ref.read(credProvider).password = val,
      prefixIcon: const Icon(Icons.lock),
      hintText: hintText ?? KatTranslations.password.tr(),
      obscureText: isObscure,

      /// TODO use an animated eye icon for the password field (fancy lottie animation ~.~)
      suffixIcon: IconButton(
        highlightColor: Colors.transparent,
        icon: FaIcon(
          isObscure
              ? FontAwesomeIcons.solidEye
              : FontAwesomeIcons.solidEyeSlash,
          color: KatColors.purple,
          size: 16,
        ),
        onPressed: () => isPassObscure.value = !isObscure,
      ),
    );
  }
}

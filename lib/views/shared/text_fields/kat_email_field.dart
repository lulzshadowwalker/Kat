import 'package:flutter/material.dart';

import 'text_feild_imports.dart';

class KatEmailField extends ConsumerWidget {
  const KatEmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KatFormField(
      validator: (val) =>
          isEmail('$val') ? null : KatTranslations.enterValidEmail.tr(),
      onSaved: (val) => ref.read(credProvider).email = '$val'.trim(),
      prefixIcon: const Icon(Icons.email),
      hintText: KatTranslations.email.tr(),
    );
  }
}

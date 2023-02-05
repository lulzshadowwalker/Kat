import 'package:flutter/material.dart';

import 'text_feild_imports.dart';

class KatEmailField extends ConsumerWidget {
  const KatEmailField({
    this.controller,
    this.initialValue,
    this.hintText,
    this.fieldKey,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final GlobalKey<FormFieldState>? fieldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KatFormField(
      key: fieldKey,
      controller: controller,
      initialValue: initialValue,
      validator: (val) =>
          isEmail('$val') ? null : KatTranslations.enterValidEmail.tr(),
      onSaved: (val) => ref.read(credProvider).email = '$val'.trim(),
      prefixIcon: const Icon(Icons.email),
      hintText: hintText ?? KatTranslations.email.tr(),
    );
  }
}

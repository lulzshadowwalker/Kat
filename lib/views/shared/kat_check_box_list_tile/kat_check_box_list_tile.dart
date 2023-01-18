import 'package:flutter/material.dart';
import '../../auth/auth_imports.dart';

class KatCheckBoxListTile extends HookWidget {
  const KatCheckBoxListTile({
    required this.title,
    required this.onChanged,
    this.value = false,
    super.key,
  });

  final Widget title;
  final void Function(bool?) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: title,
      activeColor: KatColors.primary(context),
      checkColor: KatColors.primaryContainer(context),
      checkboxShape: const CircleBorder(),
      value: value,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}

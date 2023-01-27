// ignoreforfile: publicmemberapidocs, sortconstructorsfirst
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kat/theme/kat_colors.dart';

class KatFormField extends StatelessWidget {
  const KatFormField({
    super.key,
    this.initialValue,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.autocorrect = false,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.label,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.onSaved,
    this.contentPadding,
  });

  final String? initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool autocorrect;
  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final Widget? label;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: controller,
        autocorrect: autocorrect,
        inputFormatters: inputFormatters,
        initialValue: initialValue,
        cursorWidth: 4,
        cursorRadius: const Radius.circular(50),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        maxLines: maxLines,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: KatColors.muted),
          contentPadding: const EdgeInsets.only(bottom: 5),
          hintText: hintText,
          label: label,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: KatColors.muted),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: KatColors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: KatColors.red),
          ),
        ),
      ),
    );
  }
}

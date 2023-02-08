import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../theme/kat_colors.dart';

/// e.g. "already have an account ? **Sign in**" where the second part
/// is interactable and has an accent color
class KatRichTextButton extends StatelessWidget {
  const KatRichTextButton({
    super.key,
    required this.text,
    required this.textCTA,
    required this.onTap,
    this.textAlign = TextAlign.center,
    this.color,
  });

  final String text;
  final String textCTA;
  final Color? color;
  final void Function() onTap;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 35),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(text: text),
              TextSpan(
                text: ' $textCTA',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: color ?? KatColors.purple),
                recognizer: TapGestureRecognizer()..onTap = onTap,
              ),
            ]),
      ),
    );
  }
}

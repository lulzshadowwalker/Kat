import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kat/helpers/kat_anims.dart';
import 'package:kat/views/auth/auth_imports.dart';
import 'package:lottie/lottie.dart';

/// minimally customizable elevated button that expands in the width
class KatExpandedElevatedButton extends HookWidget {
  const KatExpandedElevatedButton({
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.fontWeight,
    super.key,
  });

  final FutureOr<void> Function() onPressed;
  final Widget? leading;
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  static const _height = 35.0;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final isMounted = useIsMounted();
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        ElevatedButton.icon(
          onPressed: () async {
            if (!isLoading.value) {
              isLoading.value = true;
              await onPressed();
              if (isMounted()) {
                isLoading.value = false;
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            minimumSize: const Size.fromHeight(_height),
          ),
          icon: Padding(
            padding: (leading == null || isLoading.value)
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 8),
            child: !isLoading.value ? leading : null,
          ),
          label: isLoading.value
              ? SizedBox(
                  height: _height,
                  width: _height,
                  child: FittedBox(
                    child: LottieBuilder.asset(
                      KatAnims.nyanCat,
                    ),
                  ),
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: fontWeight,
                        color: foregroundColor ?? KatColors.purple,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
        ),
        Visibility(
          visible: isLoading.value,
          child: Positioned(
            top: -16,
            right: -16,
            child: SizedBox(
                height: _height + 13,
                width: _height + 13,
                child: FittedBox(
                  child: LottieBuilder.network(
                    'https://assets3.lottiefiles.com/packages/lf20_ttc71lib.json',
                  ),
                )),
          ),
        )
      ],
    );
  }
}

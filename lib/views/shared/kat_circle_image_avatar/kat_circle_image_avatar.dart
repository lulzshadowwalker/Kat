import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../helpers/kat_anim.dart';
import '../../../theme/kat_colors.dart';

/// circle image avatar with a cute little frog placeholder if [image] is null
class KatCircleImageAvatar extends StatelessWidget {
  const KatCircleImageAvatar({
    super.key,
    this.radius = 128,
    required this.image,
  });

  final double radius;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: KatColors.pink,
        shape: BoxShape.circle,
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: image == null
          ? FractionallySizedBox(
              widthFactor: 0.65,
              child: LottieBuilder.asset(KatAnim.frog),
            )
          : null,
    );
  }
}

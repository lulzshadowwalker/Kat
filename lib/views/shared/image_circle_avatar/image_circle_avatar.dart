import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../helpers/kat_anim.dart';
import 'package:lottie/lottie.dart';
import '../../../helpers/kat_helpers.dart';

import '../../../theme/kat_colors.dart';

/// interactable circle avatar
/// ..
/// user can tap to select an image
class ImageCircleAvatar extends HookWidget {
  const ImageCircleAvatar({
    this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(Uint8List?)? onSelected;
  static const double _radius = 128;

  @override
  Widget build(BuildContext context) {
    final image = useState<Uint8List?>(null);

    useEffect(() {
      /// if no callback is provided, don't add listeners :D
      if (onSelected == null) return null;

      void listener() {
        onSelected!(image.value);
      }

      image.addListener(() => listener());

      return () => image.removeListener(() => listener());
    });

    return GestureDetector(
      onTap: () async {
        final i = await KatHelpers.pickImage(context);

        /// if the user aborts the process of selecting another image,
        ///  don't assign [null] instead of the previously selected image
        if (i == null) return;

        image.value = i;
      },
      child: Stack(
        children: [
          Container(
            height: _radius,
            width: _radius,
            decoration: BoxDecoration(
              color: KatColors.pink,
              shape: BoxShape.circle,
              image: image.value != null
                  ? DecorationImage(
                      image: Image.memory(image.value!).image,
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: image.value == null
                ? FractionallySizedBox(
                    widthFactor: 0.65,
                    child: LottieBuilder.asset(KatAnim.frog),
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 8,
            child: FaIcon(
              FontAwesomeIcons.circlePlus,
              color: KatColors.purple,
            ),
          )
        ],
      ),
    );
  }
}

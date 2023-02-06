import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../auth/auth_imports.dart';
import '../kat_circle_image_avatar/kat_circle_image_avatar.dart';

/// interactable circle avatar
/// ..
/// user can tap to select an image
class ImagePickerCircleAvatar extends HookWidget {
  const ImagePickerCircleAvatar({
    this.onSelected,
    this.initialImage,
    Key? key,
  }) : super(key: key);

  final void Function(Uint8List? image)? onSelected;
  final ImageProvider? initialImage;
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
          KatCircleImageAvatar(
            radius: _radius,
            image: image.value.asMemImg ?? initialImage,
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

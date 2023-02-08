import '../models/attribution.dart';

import '../models/enums/attribute_type.dart';

class KatAnims {
  /// https://lottiefiles.com/75212-cat-loader
  static const String loading = 'assets/anims/loading.json';

  static const notFound = <String>[
    /// https://lottiefiles.com/119968-alien-spaceship-abducting-a-cat-404-error
    'assets/anims/cat-404-1.json',

    /// https://lottiefiles.com/120103-404-error-page-with-cute-cat
    'assets/anims/cat-404-2.json',

    /// https://lottiefiles.com/120102-404-error-page-with-cat
    'assets/anims/cat-404-3.json',
  ];

  /// https://lottiefiles.com/96002-cute-froggy-looking-around
  static const String frog = 'assets/anims/frog.json';

  /// https://lottiefiles.com/69679-cheeky-face
  static const String cheeky = 'assets/anims/cheeky.json';

  /// https://lottiefiles.com/58563-heart-icon
  static const String heart = 'assets/anims/heart.json';

  /// https://lottiefiles.com/16193-animated-contest-4-at-tgsticker-sticker-23
  static const String clown = 'assets/anims/clown.json';

  /// https://lottiefiles.com/74680-confetti
  static const String confetti = 'assets/anims/confetti.json';

  /// https://lottiefiles.com/98741-success
  static const String success = 'assets/anims/success.json';

  /// https://lottiefiles.com/74164-warning
  static const String oops = 'assets/anims/oops.json';

  /// https://lottiefiles.com/86893-info-icon
  static const String tip = 'assets/anims/tip.json';

  /// https://lottiefiles.com/95379-warning
  static const String warning = 'assets/anims/warning.json';

  /// https://lottiefiles.com/88299-owls
  static const String owl = 'assets/anims/owl.json';

  /// https://lottiefiles.com/112646-party-pigeon
  static const String pigeon = 'assets/anims/pigeon.json';

  /// https://lottiefiles.com/6893-pulp-fiction-cat
  static const String catHey = 'assets/anims/cat-hey.json';

  /// https://lottiefiles.com/125009-gibli-tribute
  static const String ghibliKiki = 'assets/anims/ghibli-kiki.json';

  static List<Attribution> attributions = [
    const Attribution(
      assetPath: loading,
      url: 'https://lottiefiles.com/75212-cat-loader',
      attributeType: AttributeType.anim,
    ),
    Attribution(
      assetPath: notFound[0],
      url:
          'https://lottiefiles.com/119968-alien-spaceship-abducting-a-cat-404-error',
      attributeType: AttributeType.anim,
    ),
    Attribution(
      assetPath: notFound[1],
      url: 'https://lottiefiles.com/120103-404-error-page-with-cute-cat',
      attributeType: AttributeType.anim,
    ),
    Attribution(
      assetPath: notFound[2],
      url: 'https://lottiefiles.com/120102-404-error-page-with-cat',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: frog,
      url: 'https://lottiefiles.com/96002-cute-froggy-looking-around',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: heart,
      url: 'https://lottiefiles.com/58563-heart-icon',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: clown,
      url:
          'https://lottiefiles.com/16193-animated-contest-4-at-tgsticker-sticker-23',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: confetti,
      url: 'https://lottiefiles.com/74680-confetti',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: success,
      url: 'https://lottiefiles.com/98741-success',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: oops,
      url: 'https://lottiefiles.com/74164-warning',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: tip,
      url: 'https://lottiefiles.com/86893-info-icon',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: warning,
      url: 'https://lottiefiles.com/95379-warning',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: owl,
      url: 'https://lottiefiles.com/88299-owls',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: pigeon,
      url: 'https://lottiefiles.com/112646-party-pigeon',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: ghibliKiki,
      url: 'https://lottiefiles.com/125009-gibli-tribute',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: catHey,
      url: 'https://lottiefiles.com/6893-pulp-fiction-cat',
      attributeType: AttributeType.anim,
    ),
    const Attribution(
      assetPath: cheeky,
      url: 'https://lottiefiles.com/69679-cheeky-face',
      attributeType: AttributeType.anim,
    ),
  ];
}

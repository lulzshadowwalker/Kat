import '../models/attribution.dart';
import '../models/enums/attribute_type.dart';

class KatImages {
  /// https://icons8.com/illustrations/illustration/vivid-background-mountains
  static const String daySky = 'assets/images/day-sky.png';

  /// https://icons8.com/illustrations/illustration/transistor-night-sky-background
  static const String nightSky = 'assets/images/night-sky.png';

  static const List<Attribution> attributions = [
    Attribution(
      assetPath: daySky,
      url:
          'https://icons8.com/illustrations/illustration/vivid-background-mountains',
      attributeType: AttributeType.image,
    ),
    Attribution(
      assetPath: nightSky,
      url:
          'https://icons8.com/illustrations/illustration/transistor-night-sky-background',
      attributeType: AttributeType.image,
    ),
  ];
}

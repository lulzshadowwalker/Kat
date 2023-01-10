import '../views/auth/auth_imports.dart';

const _showcaseTerms = <String>[
  KatTranslations.goodMorning,
  KatTranslations.howAreYou,
  KatTranslations.onMyPuter,
  KatTranslations.iWouldLikeSomeCoffee,
];

/// periodic stream of predefined words
final wordsProvider = StreamProvider<String>(
  (ref) {
    return Stream.periodic(
      const Duration(milliseconds: 2500),
      (count) => _showcaseTerms[count % _showcaseTerms.length],
    );
  },
);

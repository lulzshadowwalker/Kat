import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'search_terms_provider.dart';
import 'word_provider.dart';

import '../translations/kat_translations.dart';

final processingInputProvider = Provider<String>(
  (ref) {
    final term = ref.watch(searchTermsProvider);
    final showcaseWord = ref.watch(wordsProvider).asData;

    if (term == null || term.isEmpty) {
      return tr(showcaseWord?.value ?? KatTranslations.saySomething);
    }

    return term;
  },
);

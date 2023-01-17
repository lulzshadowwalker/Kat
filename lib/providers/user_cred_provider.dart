import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/kat_user_cred.dart';

final credProvider = StateNotifierProvider<CredNotifier, KatUserCred>((ref) {
  return CredNotifier(KatUserCred());
});

class CredNotifier extends StateNotifier<KatUserCred> {
  CredNotifier(super.state);

  void setData(KatUserCred data) => state = data;
}

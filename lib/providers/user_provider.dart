import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/remote_db_controller.dart';

final userProvider = StreamProvider.autoDispose((ref) {
  return RemoteDbController.currentUserData;
});

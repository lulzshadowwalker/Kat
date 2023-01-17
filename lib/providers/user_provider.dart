import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kat/controllers/remote_db_controller.dart';

final userProvider = StreamProvider((ref) {
  return RemoteDbController.currentUserData;
});

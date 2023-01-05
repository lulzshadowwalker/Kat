import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../hooks/use_invalidate_cred.dart';

import '../../controllers/auth_controller.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInvalidateCred(ref);

    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () async {
            await AuthController.signOut(context);
          },
          icon: const Icon(Icons.exit_to_app),
          label: const Text('Sign out'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kat/views/auth/auth_imports.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => AuthController.signOut(context),
        child: const Text('Sign out'),
      ),
    );
  }
}

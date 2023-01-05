import 'package:flutter/material.dart';
import '../views/auth/auth_imports.dart';

/// invalidates user credential data
void useInvalidateCred(WidgetRef ref) {
  useEffect(() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ref.invalidate(credProvider));
    return null;
  });
}

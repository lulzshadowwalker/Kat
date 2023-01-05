import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  /// a change notifier that notifies listeners when a new value
  /// is recieved from the given stream
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
      (val) {
        if (val != _previousVal) notifyListeners();
      },
    );
  }

  dynamic _previousVal;
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

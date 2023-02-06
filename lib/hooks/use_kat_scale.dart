import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';

double useKatScale() {
  final scale = useState(0.5);
  final isMounted = useIsMounted();

  useEffect(
    () {
      Timer(
        const Duration(milliseconds: 50),
        () {
          if (isMounted()) scale.value = 1;
        },
      );
      return null;
    },
  );

  return scale.value;
}

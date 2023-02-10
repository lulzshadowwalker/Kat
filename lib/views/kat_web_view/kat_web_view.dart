import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../auth/auth_imports.dart';
import '../shared/loading/loading.dart';

class KatWebView extends HookWidget {
  const KatWebView({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final opacity = useState(1.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: KatColors.mutedLight),
        ),
        backgroundColor: KatColors.purple,
        foregroundColor: KatColors.mutedLight,
      ),
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: 1 - opacity.value,
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              zoomEnabled: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onProgress: (p) {
                isLoading.value = p <= 60;
                if (isLoading.value) opacity.value = 0;
              },
            ),
          ),
          Visibility(
            visible: isLoading.value,
            child: const Loading(),
          ),
        ],
      ),
    );
  }
}

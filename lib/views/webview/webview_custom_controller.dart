import 'package:flutter/cupertino.dart';
import 'package:genie/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';

// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewCustomController extends BaseController {
  var isLoadingPage = true.obs;
  var postUrl = "".obs;
  var title = "".obs;
  var progressValue = 0.0.obs;
  dynamic argumentData = Get.arguments;
  late final WebViewController webViewController;

  @override
  void onInit() {
    if (argumentData['postUrl'] != null) {
      postUrl.value = argumentData['postUrl'];
      title.value = argumentData['title'];
      setWebViewData(postUrl.value);
    }
    super.onInit();
  }

  void setWebViewData(String url) {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final WebViewController defaultController =
        WebViewController.fromPlatformCreationParams(params);
    if (postUrl.value.isNotEmpty) {
      defaultController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onProgress: (int progress) {
            progressValue.value = progress.toDouble() / 100;
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            isLoading.value = false;
          },
        ))
        ..loadRequest(Uri.parse(
          url,
        ));

      // #docregion platform_features
      if (defaultController.platform is AndroidWebViewController) {
        AndroidWebViewController.enableDebugging(true);
        (defaultController.platform as AndroidWebViewController)
            .setMediaPlaybackRequiresUserGesture(false);
      }
      webViewController = defaultController;
    }
  }
}

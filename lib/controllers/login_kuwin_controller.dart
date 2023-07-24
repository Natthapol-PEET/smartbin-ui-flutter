import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class LoginKuwinController extends GetxController {
  WebViewXController? webviewController;

  bool lock = false;

  void setWebviewXController(WebViewXController controller) {
    if (lock) return;
    webviewController = controller;
    lock = true;

    webviewController?.loadContent(
      'https://flutter.dev',
      SourceType.url,
    );
  }

  @override
  void onClose() {
    webviewController?.dispose();
    super.onClose();
  }
}

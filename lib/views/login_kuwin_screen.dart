import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/login_kuwin_controller.dart';
import 'package:webviewx/webviewx.dart';

class LoginKuwinScreen extends GetView<LoginKuwinController> {
  const LoginKuwinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: WebViewX(
        initialContent: '<h2> Hello, world! </h2>',
        initialSourceType: SourceType.html,
        onWebViewCreated: (webviewController) => controller.setWebviewXController(webviewController),
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}

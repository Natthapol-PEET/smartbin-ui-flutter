import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:smartbin_ui_flutter/controllers/render_html_controller.dart';
import 'package:webviewx/webviewx.dart';

class RenderHtmlScreen extends GetView<RenderHtmlController> {
  const RenderHtmlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewX(
        key: const ValueKey('webviewx'),
        height: Get.height,
        width: Get.width,
        initialContent: controller.initContent,
        initialSourceType: SourceType.html,
        // onWebViewCreated: controller.initController,
        jsContent: {
          EmbeddedJsContent(
            js: controller.setPointerEvents,
          ),
        },
      ),
    );
  }
}

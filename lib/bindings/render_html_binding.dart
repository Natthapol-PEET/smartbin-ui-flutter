import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/controllers/render_html_controller.dart';

class RenderHtmlBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RenderHtmlController());
  }
}

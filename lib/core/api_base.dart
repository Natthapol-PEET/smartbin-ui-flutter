import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:smartbin_ui_flutter/core/configs.dart';

class BaseApi extends GetConnect {
  final env = Get.find<Configs>();
  String? get keyApp => env.getKeyApp();
  String? get enpoint => env.getDomain();

  @override
  void onInit() {
    httpClient.baseUrl = enpoint;

    httpClient.addRequestModifier((Request request) {
      request.headers['authorization'] = 'Bearer $keyApp';
      request.headers['Content-Type'] = "application/json";
      return request;
    });
  }
}

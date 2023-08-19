import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:smartbin_ui_flutter/core/configs.dart';

class BaseApi extends GetConnect {
  // final env = Get.put(Configs());
  // String? get keyApp => env.getKeyApp();
  // String? get endpoint => env.getDomain();

  String? get keyApp => '1234';
  String? get endpoint => 'http://localhost:8080/api/v1';

  @override
  void onInit() {
    httpClient.baseUrl = endpoint;

    httpClient.addRequestModifier((Request request) {
      request.headers['authorization'] = 'Bearer $keyApp';
      request.headers['Content-Type'] = "application/json";
      return request;
    });
  }
}

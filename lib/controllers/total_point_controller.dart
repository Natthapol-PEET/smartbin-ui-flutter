import 'package:get/get.dart';

class TotalPointController extends GetxController {
  String studentId = '';
  int point = 0;

  Map<String, dynamic> get args => Get.arguments;
  // Map<String, dynamic> get args => <String, dynamic>{
  //       'display': 'ผู้พิทักษ์โลก',
  //       'point': 200,
  //     };

  @override
  void onInit() {
    super.onInit();

    try {
      studentId = args['display'];
      point = args['point'];
    } catch (e) {}
  }
}

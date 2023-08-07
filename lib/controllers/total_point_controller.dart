import 'package:get/get.dart';

class TotalPointController extends GetxController {
  String studentId = '';
  int point = 0;

  // Map<String, dynamic> get args => Get.arguments;
  Map<String, dynamic> get args => <String, dynamic>{
        'studentId': '6040202424',
        'point': 200,
      };

  @override
  void onInit() {
    super.onInit();

    studentId = args['studentId'];
    point = args['point'];
  }
}

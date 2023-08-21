import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/api_base.dart';
import 'package:smartbin_ui_flutter/core/const.dart';

class SmartBinApi extends BaseApi {
  Future<Response> getAmountWaste() => get('/smartbin/check-bin/$TYPE_TEST');

  Future<Response> loginByStudentId(String sid) => post('/smartbin/login_student_id?student_id=$sid', {});

  Future<Response> getQrCodeAccessToken() => get('/smartbin/get_qrcode_access_token');

  Future<Response> getDataType() => get('/smartbin/get_data_type');

  Future<Response> userSelectType(Map<String, String> body) => post('/smartbin/user_select_type', body);

  Future<Response> lightManagement(String status) => get('/smartbin/set-ligth/$TYPE_TEST/$status');

  // Future<Response> predictionLogin(Map<String, String> body) =>
  //     post('/smartbin/prediction_login', body);

  // Future<Response> prediction(String endpoint, Map<String, String> body) =>
  //     post('/smartbin/$endpoint', body);

  Future<Response> prediction(Map<String, String> body, {required bool isDonate}) =>
      post('/smartbin/prediction/$TYPE_TEST/${isDonate ? 'donate' : 'undonate'}', body);

  Future<Response> playSound({required String command}) => get('/sound/play?command=$command');
}

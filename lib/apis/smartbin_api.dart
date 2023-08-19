import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/core/api_base.dart';

class SmartBinApi extends BaseApi {
  Future<Response> getAmountWaste() => get('/smartbin/amount_waste');

  Future<Response> loginByStudentId(String sid) =>
      post('/smartbin/login_student_id?student_id=$sid', {});

  Future<Response> getQrCodeAccessToken() =>
      get('/smartbin/get_qrcode_access_token');

  Future<Response> getDataType() => get('/smartbin/get_data_type');

  Future<Response> userSelectType(Map<String, String> body) =>
      post('/smartbin/user_select_type', body);

  Future<Response> predictionLogin(Map<String, String> body) =>
      post('/smartbin/prediction_login', body);

  Future<Response> prediction(String endpoint, Map<String, String> body) =>
      post('/smartbin/$endpoint', body);
}

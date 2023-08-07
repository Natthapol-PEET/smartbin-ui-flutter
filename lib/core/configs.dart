import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class Configs extends GetxService {
  @override
  void onInit() async {
    super.onInit();

    await dotenv.load(fileName: "env/.env");
  }

  getDomain() => dotenv.env['DOMAIN'];

  getKeyApp() => dotenv.env['KEY_APP'];
}

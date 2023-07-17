import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/bindings/home_screen.dart';
import 'package:smartbin_ui_flutter/bindings/video_binding.dart';
import 'package:smartbin_ui_flutter/views/home_screen.dart';
import 'package:smartbin_ui_flutter/views/how_to_screen.dart';
import 'package:smartbin_ui_flutter/views/process_screen.dart';
import 'package:smartbin_ui_flutter/views/qrcode_id_screen.dart';
import 'package:smartbin_ui_flutter/views/saving_donate_screen.dart';
import 'package:smartbin_ui_flutter/views/enter_id_screen.dart';
import 'package:smartbin_ui_flutter/views/scan_qrcode_screen.dart';
import 'package:smartbin_ui_flutter/views/thanks_screen.dart';
import 'package:smartbin_ui_flutter/views/video_screen.dart';

class RoutePath {
  static String home = '/home_screen';
  static String video = '/video_screen';
  static String howto = '/howto_screen';
  static String savingDonate = '/saving_donate_screen';
  static String qrcodeId = '/qrcode_id_screen';
  static String scanQRCode = '/scan_qrcode_screen';
  static String enterId = '/enter_id_screen';
  static String process = '/process_screen';
  static String thanks = '/thanks_screen';
}

class AppRout {
  static List<GetPage<dynamic>> router = [
    GetPage(
      name: RoutePath.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutePath.video,
      page: () => VideoScreen(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: RoutePath.howto,
      page: () => HowToScreen(),
    ),
    GetPage(
      name: RoutePath.savingDonate,
      page: () => SavingDonateScreen(),
    ),
    GetPage(
      name: RoutePath.qrcodeId,
      page: () => QRCodeIDScreen(),
    ),
    GetPage(
      name: RoutePath.scanQRCode,
      page: () => ScanQRCodeScreen(),
    ),
    GetPage(
      name: RoutePath.enterId,
      page: () => EnterIDScreen(),
    ),
    GetPage(
      name: RoutePath.process,
      page: () => ProcessScreen(),
    ),
    GetPage(
      name: RoutePath.thanks,
      page: () => ThanksScreen(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/bindings/enter_id_binding.dart';
import 'package:smartbin_ui_flutter/bindings/home_screen.dart';
import 'package:smartbin_ui_flutter/bindings/login_kuwin_binding.dart';
import 'package:smartbin_ui_flutter/bindings/process_binding.dart';
import 'package:smartbin_ui_flutter/bindings/scan_qrcode_binding.dart';
import 'package:smartbin_ui_flutter/bindings/user_select_type_binding.dart';
import 'package:smartbin_ui_flutter/views/home_screen.dart';
import 'package:smartbin_ui_flutter/views/how_to_screen.dart';
import 'package:smartbin_ui_flutter/views/login_kuwin_screen.dart';
import 'package:smartbin_ui_flutter/views/process_screen.dart';
import 'package:smartbin_ui_flutter/views/qrcode_id_screen.dart';
import 'package:smartbin_ui_flutter/views/saving_donate_screen.dart';
import 'package:smartbin_ui_flutter/views/enter_id_screen.dart';
import 'package:smartbin_ui_flutter/views/scan_qrcode_screen.dart';
import 'package:smartbin_ui_flutter/views/thanks_screen.dart';
import 'package:smartbin_ui_flutter/views/user_select_type_screen.dart';

class RoutePath {
  static String home = '/home_screen';
  static String video = '/video_screen';
  static String howto = '/howto_screen';
  static String savingDonate = '/saving_donate_screen';
  static String qrcodeId = '/qrcode_id_screen';
  static String scanQRCode = '/scan_qrcode_screen';
  static String enterId = '/enter_id_screen';
  static String process = '/process_screen';
  static String userSelectType = '/userSelectType_screen';
  static String thanks = '/thanks_screen';
  static String loginKuWin = '/loginKuWin_screen';
}

class AppRout {
  static List<GetPage<dynamic>> router = [
    GetPage(
      name: RoutePath.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutePath.howto,
      page: () => const HowToScreen(),
    ),
    GetPage(
      name: RoutePath.savingDonate,
      page: () => const SavingDonateScreen(),
    ),
    GetPage(
      name: RoutePath.qrcodeId,
      page: () => const QRCodeIDScreen(),
    ),
    GetPage(
      name: RoutePath.scanQRCode,
      page: () => const ScanQRCodeScreen(),
      binding: ScanQrCodeBinding(),
    ),
    GetPage(
      name: RoutePath.enterId,
      page: () => const EnterIDScreen(),
      binding: EnterIDBinding(),
    ),
    GetPage(
      name: RoutePath.process,
      page: () => const ProcessScreen(),
      binding: ProcessBinding(),
    ),
    GetPage(
      name: RoutePath.userSelectType,
      page: () => const UserSelectTypeScreen(),
      binding: UserSelectTypeBinding(),
    ),
    GetPage(
      name: RoutePath.thanks,
      page: () => const ThanksScreen(),
    ),
    GetPage(
      name: RoutePath.loginKuWin,
      page: () => const LoginKuwinScreen(),
      binding: LoginKuwinBinding(),
    ),
  ];
}

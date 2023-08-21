import 'package:get/get.dart';
import 'package:smartbin_ui_flutter/bindings/enter_id_binding.dart';
import 'package:smartbin_ui_flutter/bindings/home_binding.dart';
import 'package:smartbin_ui_flutter/bindings/process_binding.dart';
import 'package:smartbin_ui_flutter/bindings/qrcode_survey_binding.dart';
import 'package:smartbin_ui_flutter/bindings/render_html_binding.dart';
import 'package:smartbin_ui_flutter/bindings/scan_qrcode_binding.dart';
import 'package:smartbin_ui_flutter/bindings/thanks_binding.dart';
import 'package:smartbin_ui_flutter/bindings/total_point_binding.dart';
import 'package:smartbin_ui_flutter/bindings/video_binding.dart';
import 'package:smartbin_ui_flutter/views/full_screen.dart';
import 'package:smartbin_ui_flutter/views/home_screen.dart';
import 'package:smartbin_ui_flutter/views/how_to_screen.dart';
import 'package:smartbin_ui_flutter/views/process_screen.dart';
import 'package:smartbin_ui_flutter/views/qrcode_id_screen.dart';
import 'package:smartbin_ui_flutter/views/qrcode_survey_screen.dart';
import 'package:smartbin_ui_flutter/views/render_html_screen.dart';
import 'package:smartbin_ui_flutter/views/saving_donate_screen.dart';
import 'package:smartbin_ui_flutter/views/enter_id_screen.dart';
import 'package:smartbin_ui_flutter/views/scan_qrcode_screen.dart';
import 'package:smartbin_ui_flutter/views/thanks_screen.dart';
import 'package:smartbin_ui_flutter/views/total_point_screen.dart';
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
  static String totalPoint = '/total_point_screen';
  static String survey = '/survey_screen';
  static String thanks = '/thanks_screen';
  static String renderHtml = '/render_html_screen';
  static String fullBin = '/full_bin_screen';
}

class AppRout {
  static List<GetPage<dynamic>> router = [
    GetPage(
      name: RoutePath.video,
      page: () => const VideoScreen(),
      binding: VideoBinding(),
    ),
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
      name: RoutePath.totalPoint,
      page: () => const TotalPointScreen(),
      binding: TotalPointBinding(),
    ),
    GetPage(
      name: RoutePath.survey,
      page: () => const QrCodeSurveyScreen(),
      binding: QrCodeSurveyBinding(),
    ),
    GetPage(
      name: RoutePath.thanks,
      page: () => const ThanksScreen(),
      binding: ThanksBinding(),
    ),
    GetPage(
      name: RoutePath.renderHtml,
      page: () => const RenderHtmlScreen(),
      binding: RenderHtmlBinding(),
    ),
    GetPage(
      name: RoutePath.fullBin,
      page: () => const FullBinScreen(),
    ),
  ];
}

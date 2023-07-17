import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartbin_ui_flutter/controllers/home_controller.dart';
import 'package:smartbin_ui_flutter/core/router.dart';
import 'package:smartbin_ui_flutter/core/sound.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';
import 'package:smartbin_ui_flutter/widgets/wave_progress.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image.asset(
          //   'assets/images/kuse-smart-bin.png',
          //   height: 50,
          // ),
          Text(
            'KUSE SMART BIN',
            style: GoogleFonts.kanit(
              fontSize: 72,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF377422),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TrashTypeCircle(
                type: 'ขวดแก้ว',
                progress: 30,
                color: Color(0xFF77AE54),
                image: 'assets/images/icons/wine.png',
              ),
              TrashTypeCircle(
                type: 'พลาสติก',
                progress: 80,
                color: Color.fromARGB(255, 64, 186, 243),
                image: 'assets/images/icons/plastic.png',
              ),
              TrashTypeCircle(
                type: 'กระป๋อง',
                progress: 60,
                color: Color(0xFFFDDE72),
                image: 'assets/images/icons/beer-can.png',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                // onTap: () => Get.toNamed(RoutePath.savingDonate),
                onTap: () => Get.toNamed(RoutePath.video),
                child: Image.asset('assets/images/buttons/exchange.png'),
              ),
              const SizedBox(width: 50),
              InkWell(
                // onTap: () => Get.toNamed(RoutePath.howto),
                onTap: () => controller.playSound.on(SourceMP3.gun),
                child: Image.asset('assets/images/buttons/howto.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrashTypeCircle extends StatelessWidget {
  const TrashTypeCircle({
    super.key,
    required this.image,
    required this.type,
    required this.progress,
    required this.color,
  });

  final String image;
  final String type;
  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return WaveProgress(
      size: 200,
      borderColor: Colors.black,
      fillColor: color,
      progress: progress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 12),
          Text(
            type,
            style: GoogleFonts.kanit(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            progress == 100 ? 'เต็มแล้ว' : '$progress %',
            style: GoogleFonts.kanit(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

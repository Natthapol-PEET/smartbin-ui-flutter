import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:smartbin_ui_flutter/core/const.dart';

class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/screens/howto.png',
              width: SCREEN_WIDTH,
              height: SCREEN_HEIGHT,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: SCREEN_WIDTH / 2 - 45,
              bottom: 30,
              child: InkWell(
                onTap: () => Get.back(),
                child: Image.asset('assets/images/buttons/howto-back.png', height: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

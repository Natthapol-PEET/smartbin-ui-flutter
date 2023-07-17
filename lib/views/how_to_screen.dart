import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HowToScreen extends StatelessWidget {
  const HowToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 800,
        height: 480,
        child: Stack(
          children: [
            Image.asset('assets/images/screens/howto.png'),
            Positioned(
              left: 300,
              bottom: 40,
              child: InkWell(
                onTap: () => Get.back(),
                child: Image.asset('assets/images/buttons/howto-back.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

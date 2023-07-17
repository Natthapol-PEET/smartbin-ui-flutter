import 'package:flutter/material.dart';
import 'package:smartbin_ui_flutter/widgets/background.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/images/gif/cant-thankyou-enough.gif', scale: 2),
            const SizedBox(height: 20),
            Image.asset('assets/images/powered-by-KUSE-Startup-House.png'),
          ],
        ),
      ),
    );
  }
}

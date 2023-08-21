import 'package:flutter/material.dart';
import 'package:smartbin_ui_flutter/core/const.dart';

class FullBinScreen extends StatelessWidget {
  const FullBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/bin_full.png',
        height: SCREEN_HEIGHT,
        width: SCREEN_WIDTH,
        fit: BoxFit.fill,
      ),
    );
  }
}

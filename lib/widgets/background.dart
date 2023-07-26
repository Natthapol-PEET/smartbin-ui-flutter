import 'package:flutter/material.dart';
import 'package:smartbin_ui_flutter/core/const.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.cover,
            width: SCREEN_WIDTH,
            height: SCREEN_HEIGHT,
          ),
          Positioned(
            child: SizedBox(
              width: SCREEN_WIDTH,
              height: SCREEN_HEIGHT,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

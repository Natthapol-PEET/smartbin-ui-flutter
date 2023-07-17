import 'package:flutter/material.dart';

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
            width: 800,
            height: 480,
          ),
          Positioned(
            child: SizedBox(
              width: 800,
              height: 480,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

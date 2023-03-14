import 'package:flutter/material.dart';

class MyGradientBackground extends LinearGradient {
  MyGradientBackground()
      : super(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFFB44FBE), const Color(0xFFB44FBE), const Color(0xFFF4E1F5)],
          stops: [0.0, 0.4, 1.0],
        );
}

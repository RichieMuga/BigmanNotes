import 'package:flutter/material.dart';

class MyGradientBackground extends LinearGradient {
  MyGradientBackground()
      : super(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0080FF), Color(0xFF0036FF)],
          stops: [0.0, 1.0],
        );
}

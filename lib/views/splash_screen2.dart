import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;

  GradientScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 0.2),
                Colors.white,
              ]),
        ),
        child: body,
      ),
    );
  }
}

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              "WELCOME"
              "  TO",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color:const Color.fromRGBO(61, 27, 64, 1),
                  fontFamily: 'Poppins',
                  fontSize: 26,
                  letterSpacing: 3)),
        
        ],
      ),
    ));
  }
}

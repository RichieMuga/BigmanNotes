import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  final double width=10;

  const SizedBoxWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

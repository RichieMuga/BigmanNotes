import 'package:flutter/material.dart';

class ExpandedImageWidget extends StatelessWidget {
  final String imagePath;
  final double width=50;
  final double height=100;

  const ExpandedImageWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}

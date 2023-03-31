import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  const CustomDivider({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      height: height,
      width: 1,
      color: const Color(0XFFE0E0E0),
    );
  }
}

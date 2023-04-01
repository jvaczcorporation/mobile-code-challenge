import 'package:flutter/material.dart';

class ButtonNavigator extends StatelessWidget {
  final bool visible;
  final IconData icon;

  final VoidCallback? onPressed;

  const ButtonNavigator({
    super.key,
    required this.visible,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: visible,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../consts/constants.dart';
import '../responsive.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
  });
  // You can use Function instead of VoidCallback
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding * 1.5,
          vertical: defaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        icon,
        size: 20,
        color: iconColor,
      ),
      label: Text(text, style: TextStyle(color: textColor),),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {

  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const ButtonCircle({
    Key? key,
    required this.icon,
    required this.iconSize,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle
      ),
      margin: EdgeInsets.all(6),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double? width;
  final double? height;
  final double? fontSize;
  double rounded;

  Button({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.fontSize,
    this.rounded = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(rounded),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

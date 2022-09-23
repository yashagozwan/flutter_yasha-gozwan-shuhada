import 'package:flutter/material.dart';

class ButtonPro extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double rounded;
  final Color? background;
  final double? width;

  const ButtonPro({
    super.key,
    required this.onPressed,
    required this.title,
    this.rounded = 14,
    this.background,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rounded),
          ),
        ),
        child: Text(title),
      ),
    );
  }
}

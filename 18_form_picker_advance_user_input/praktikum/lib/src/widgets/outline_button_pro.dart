import 'package:flutter/material.dart';

class OutlineButtonPro extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final double rounded;

  const OutlineButtonPro({
    super.key,
    required this.onPressed,
    required this.title,
    this.rounded = 14,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rounded),
          ),
          alignment: Alignment.centerLeft,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

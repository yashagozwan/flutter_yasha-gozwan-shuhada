import 'package:flutter/material.dart';
import 'text_pro.dart';

class ElevatedButtonPro extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const ElevatedButtonPro({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: TextPro(text),
    );
  }
}

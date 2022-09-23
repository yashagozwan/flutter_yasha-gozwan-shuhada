import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final double bottom;

  const Label(
    this.text, {
    super.key,
    this.bottom = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}

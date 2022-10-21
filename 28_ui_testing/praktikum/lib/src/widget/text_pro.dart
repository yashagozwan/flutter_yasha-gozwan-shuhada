import 'package:flutter/material.dart';

class TextPro extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;

  const TextPro(this.data,
      {super.key,
      this.textAlign,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}

import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        FontWeight,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;

class TextPro extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;

  const TextPro(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}

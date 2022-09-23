import 'package:flutter/material.dart';

class Textarea extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final double? height;

  const Textarea({
    super.key,
    this.controller,
    this.maxLines,
    this.padding,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.multiline,
        controller: controller,
        maxLines: maxLines,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}

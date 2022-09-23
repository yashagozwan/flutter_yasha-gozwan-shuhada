import 'package:flutter/material.dart';

class ImageFrame extends StatelessWidget {
  final Widget? content;

  const ImageFrame({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: content,
    );
  }
}

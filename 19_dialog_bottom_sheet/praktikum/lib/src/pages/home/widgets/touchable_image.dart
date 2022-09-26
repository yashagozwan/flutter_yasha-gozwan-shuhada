import 'package:flutter/material.dart';

class TouchableImage extends StatelessWidget {
  final String imageSrc;
  final void Function() onPressed;

  const TouchableImage({
    Key? key,
    required this.imageSrc,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(imageSrc),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.1),
              onTap: onPressed,
            ),
          ),
        )
      ],
    );
  }
}

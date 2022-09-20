import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final void Function() onPressed;

  const MyIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: icon,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}

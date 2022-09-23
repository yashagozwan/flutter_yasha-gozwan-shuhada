import 'package:flutter/material.dart';

class ButtonPub extends StatelessWidget {
  final void Function() onPressed;
  final Icon icon;
  final String title;

  const ButtonPub({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
        onPressed: onPressed,
        label: Text(title),
        icon: icon,
      ),
    );
  }
}

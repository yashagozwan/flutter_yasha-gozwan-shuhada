import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData iconData;

  const Button({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {},
          child: Icon(
            iconData,
          ),
        ),
      ),
    );
  }
}

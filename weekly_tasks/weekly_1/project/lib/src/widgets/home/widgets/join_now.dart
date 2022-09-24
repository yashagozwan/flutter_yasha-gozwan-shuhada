import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JoinNow extends StatelessWidget {
  final void Function() onPressed;

  const JoinNow({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: SvgPicture.asset(
            'assets/svg/koi.svg',
            width: 70,
            height: 70,
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'koi inc',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text('Join with us for dream job'),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(14)),
              child: const Text('Join'),
            ),
          ],
        ),
      ],
    );
  }
}

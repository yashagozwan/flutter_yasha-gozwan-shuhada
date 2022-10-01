import 'package:flutter/material.dart';

class BottomNavigationPro extends StatelessWidget {
  const BottomNavigationPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Center(
                  child: Icon(Icons.qr_code),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}

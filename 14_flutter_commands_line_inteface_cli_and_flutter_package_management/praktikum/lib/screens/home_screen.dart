import 'package:flutter/material.dart';
import 'barcode_screen.dart';
import 'badges_screen.dart';
import '../widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              fontSize: 24,
              height: 80,
              width: 120,
              title: 'Task 1',
              rounded: 16,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const BadgesScreen();
                  }),
                );
              },
            ),
            const SizedBox(height: 10),
            Button(
              fontSize: 24,
              height: 80,
              width: 120,
              title: 'Task 2',
              rounded: 16,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const BarcodeScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

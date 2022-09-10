import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Badge(
                badgeColor: Colors.deepPurpleAccent,
                shape: BadgeShape.square,
                badgeContent: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'BADGE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Badge(
                badgeColor: Colors.deepPurpleAccent,
                shape: BadgeShape.square,
                badgeContent: const Text(
                  'BADGE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

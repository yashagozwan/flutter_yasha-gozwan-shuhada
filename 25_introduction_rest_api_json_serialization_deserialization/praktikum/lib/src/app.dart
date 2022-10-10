import 'package:flutter/material.dart';
import 'view/screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
      },
    );
  }
}

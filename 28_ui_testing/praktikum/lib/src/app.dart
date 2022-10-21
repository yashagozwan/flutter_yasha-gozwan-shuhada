import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'screen/login_screen.dart';
import 'screen/register_screen.dart';
import 'screen/welcome_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Testing',
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (_) => const WelcomeScreen(),
        RegisterScreen.route: (_) => const RegisterScreen(),
        LoginScreen.route: (_) => const LoginScreen(),
        HomeScreen.route: (_) => const HomeScreen(),
      },
    );
  }
}

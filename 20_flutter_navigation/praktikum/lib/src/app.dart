import 'package:flutter/material.dart';
import 'package:praktikum/src/navigation/screens/home_screen.dart';
import 'package:praktikum/src/navigation_named_routes//screens/home_screen.dart';

import 'navigation_named_routes/screens/form_contact.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '20 Flutter Navigation',
      home: HomeScreen(),
    );
  }
}

class AppNamedRoutes extends StatelessWidget {
  const AppNamedRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '20 Flutter Navigation',
      initialRoute: '/',
      routes: {
        '/': (_) => const HomeScreenRoute(),
        '/formContact': (_) => const FormContactRoute(),
      },
    );
  }
}

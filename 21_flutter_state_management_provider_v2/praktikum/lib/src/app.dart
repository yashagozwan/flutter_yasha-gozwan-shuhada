import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stores/contact_store.dart';
import 'screens/contact_create_screen.dart';
import 'screens/contact_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ContactStore(),
      child: MaterialApp(
        title: '21 Flutter State Management Provider v2',
        debugShowCheckedModeBanner: false,
        initialRoute: ContactScreen.route,
        routes: {
          ContactScreen.route: (context) => const ContactScreen(),
          ContactCreateScreen.route: (context) => const ContactCreateScreen(),
        },
      ),
    );
  }
}

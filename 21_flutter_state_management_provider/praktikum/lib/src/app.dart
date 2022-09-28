import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/contact_screen.dart';
import 'stores/contact_store.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Contact',
        initialRoute: ContactScreen.route,
        routes: {
          ContactScreen.route: (_) => const ContactScreen(),
        },
      ),
    );
  }
}

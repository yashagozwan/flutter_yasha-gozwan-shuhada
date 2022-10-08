import 'package:flutter/material.dart';
import 'package:praktikum/implement_provider/provider/account_provider.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';
import 'screen/register_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AccountProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RegisterScreen.route,
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}

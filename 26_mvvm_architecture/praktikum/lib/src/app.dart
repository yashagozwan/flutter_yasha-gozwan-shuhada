import 'package:flutter/material.dart';
import 'screen/home/home_screen.dart';
import 'screen/home/home_view_mode.dart';
import 'screen/task/task_view_model.dart';
import 'package:provider/provider.dart';
import 'screen/login/login_screen.dart';
import 'screen/login/login_view_model.dart';
import 'screen/register/register_screen.dart';
import 'screen/register/register_view_model.dart';
import 'screen/splash/splash_screen.dart';
import 'screen/splash/splash_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => TaskViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          LoginScreen.route: (_) => const LoginScreen(),
          RegisterScreen.route: (_) => const RegisterScreen(),
          HomeScreen.route: (_) => const HomeScreen(),
        },
      ),
    );
  }
}

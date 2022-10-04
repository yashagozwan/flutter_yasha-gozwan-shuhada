import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contact_cubit.dart';
import 'screen/form_screen.dart';
import 'screen/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        routes: {
          HomeScreen.route: (_) => const HomeScreen(),
          FormScreen.route: (_) => const FormScreen(),
        },
      ),
    );
  }
}

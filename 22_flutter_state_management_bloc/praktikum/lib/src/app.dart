import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contact_bloc.dart';
import 'screens/create/create_screen.dart';
import 'screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ContactBloc()),
      ],
      child: MaterialApp(
        title: '22 Flutter State Managements',
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.route: (_) => const HomeScreen(),
          CreateScreen.route: (_) => const CreateScreen(),
        },
      ),
    );
  }
}

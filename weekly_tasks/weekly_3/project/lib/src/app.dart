import 'package:flutter/material.dart';
import 'package:project/src/pages/home/home_page.dart';
import 'package:project/src/stores/course_store.dart';
import 'package:project/src/stores/user_store.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseStore()),
        ChangeNotifierProvider(create: (_) => UserStore()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Inter',
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}

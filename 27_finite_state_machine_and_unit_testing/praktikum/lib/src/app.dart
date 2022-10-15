import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home/food_screen.dart';
import 'screen/home/food_view_model.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoodViewModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FoodScreen(),
      ),
    );
  }
}

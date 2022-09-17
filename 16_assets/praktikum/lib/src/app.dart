import 'package:flutter/material.dart';
import 'pages/image_grid/image_grid_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '16 Assets',
      home: ImageGridPage(),
    );
  }
}

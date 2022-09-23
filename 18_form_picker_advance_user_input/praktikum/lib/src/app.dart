import 'package:flutter/material.dart';
import 'pages/post_create/post_create_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '18 Form Picker',
      home: PostCreatePage(),
    );
  }
}

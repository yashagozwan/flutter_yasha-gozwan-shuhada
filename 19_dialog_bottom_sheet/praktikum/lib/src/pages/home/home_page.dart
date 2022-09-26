import 'package:flutter/material.dart';
import 'package:praktikum/src/pages/home/widgets/content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Content(),
    );
  }
}

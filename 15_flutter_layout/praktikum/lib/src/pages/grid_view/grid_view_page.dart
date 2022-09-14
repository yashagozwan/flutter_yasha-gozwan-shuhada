import 'package:flutter/material.dart';
import 'widgets/button_section.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(7),
          color: Colors.blue[300],
          child: const Text('GridView'),
        ),
      ),
      body: const ButtonSection(),
    );
  }
}

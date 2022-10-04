import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTaped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks 1'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => _isTaped = !_isTaped),
          child: AnimatedContainer(
            width: _isTaped ? 300 : 100,
            height: _isTaped ? 300 : 100,
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_isTaped ? 14 : 50),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1492571350019-22de08371fd3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=80',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

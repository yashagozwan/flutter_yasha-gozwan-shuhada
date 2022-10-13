import 'package:flutter/material.dart';
import 'package:praktikum/src/screen/widget/elevated_button_pro.dart';

class TaskNavigator extends StatefulWidget {
  const TaskNavigator({super.key});

  @override
  State<TaskNavigator> createState() => _TaskNavigatorState();
}

class _TaskNavigatorState extends State<TaskNavigator> {
  final _title = TextEditingController();
  final _body = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _body.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TextField(
                  controller: _title,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                TextField(
                  controller: _body,
                  keyboardType: TextInputType.multiline,
                  maxLines: 100,
                  decoration: const InputDecoration(
                    hintText: 'Write something in here...',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    height: 1.3
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButtonPro(
                onPressed: () {},
                text: 'Create Task',
              ),
            ),
          )
        ],
      ),
    );
  }
}

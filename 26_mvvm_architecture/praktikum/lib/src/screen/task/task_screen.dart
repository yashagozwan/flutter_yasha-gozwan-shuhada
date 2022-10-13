import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../model/task_model.dart';
import '../home/home_view_mode.dart';
import '../widget/elevated_button_pro.dart';
import 'task_view_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _title = TextEditingController();
  final _body = TextEditingController();

  Future<void> _initial() async {
    final title = context.read<TaskViewModel>().title;
    final body = context.read<TaskViewModel>().body;
    _title.text = title;
    _body.text = body;
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _body.dispose();
  }

  void _clearEverything() {
    _title.clear();
    _body.clear();
    context.read<TaskViewModel>().titleTemp('');
    context.read<TaskViewModel>().bodyTemp('');
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
                  onChanged: (value) {
                    context.read<TaskViewModel>().titleTemp(value);
                  },
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
                  maxLines: 20,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    context.read<TaskViewModel>().bodyTemp(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Write something in here...',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(height: 1.3),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Consumer<HomeViewModel>(
                builder: (context, value, child) {
                  return ElevatedButtonPro(
                    onPressed: () async {
                      final userId = value.user?.id;
                      if (_title.text.isEmpty) return;
                      if (_body.text.isEmpty) return;
                      if (userId == null) return;

                      final task = Task(
                        title: _title.text,
                        body: _body.text,
                        isDone: false,
                        userId: userId,
                        createdAt: DateTime.now().millisecondsSinceEpoch,
                      );

                      final affectedRows =
                          await context.read<TaskViewModel>().createTask(task);
                      if (!mounted) return;
                      if (affectedRows != 1) return;

                      Fluttertoast.showToast(
                        msg: 'Task Created !',
                        backgroundColor: Colors.green,
                      );
                      _clearEverything();
                      context.read<HomeViewModel>().tapIndex(0);
                    },
                    text: 'Create Task',
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24 * 3.5, right: 24),
              child: ElevatedButton(
                onPressed: () {
                  _clearEverything();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Icon(
                  Icons.clear_all,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

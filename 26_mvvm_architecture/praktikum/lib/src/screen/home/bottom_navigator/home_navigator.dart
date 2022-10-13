import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../model/task_model.dart';
import '../../../util/util.dart';
import '../../task/task_view_model.dart';
import '../../widget/text_pro.dart';
import '../home_view_mode.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _initial() async {
    final user = await context.read<HomeViewModel>().getUser();
    if (user == null) return;
    final userId = user.id!;
    if (!mounted) return;
    context.read<TaskViewModel>().reloadTaskInfo(userId);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initial();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TaskViewModel>(
        builder: (_, value, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(24),
                child: TextPro(
                  'Come check your Task !',
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade100,
                      offset: const Offset(5, 5),
                      blurRadius: 15,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Consumer<HomeViewModel>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            onChanged: (search) {
                              context
                                  .read<TaskViewModel>()
                                  .searchTasks(value.user!.id!, search);
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              hintText: 'Search Task',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              _renderDecisionTask(value.tasks),
            ],
          );
        },
      ),
    );
  }

  Widget _renderDecisionTask(Iterable<Task> tasks) {
    if (tasks.isEmpty) {
      return Expanded(child: _taskIsNotFoundOrEmpty());
    }

    return Expanded(
      child: _buildTaskList(tasks),
    );
  }

  Widget _taskIsNotFoundOrEmpty() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextPro(
              'Task',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 24),
            SvgPicture.asset(
              'assets/svg/no_task.svg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList(Iterable<Task> tasks) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: tasks.length,
      padding: const EdgeInsets.all(24),
      itemBuilder: (context, index) {
        final task = tasks.elementAt(index);
        final isDoneColor = task.isDone ? Colors.green : Colors.red;
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: isDoneColor.shade200.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: task.isDone,
                  fillColor: MaterialStatePropertyAll<Color>(isDoneColor),
                  onChanged: (value) async {
                    task.isDone = value ?? false;
                    final affectedRows =
                        await context.read<TaskViewModel>().updateTask(task);

                    if (affectedRows == 1) {
                      Fluttertoast.showToast(
                        msg: task.isDone
                            ? 'Task is Completed'
                            : 'Task is Uncompleted',
                        backgroundColor:
                            task.isDone ? Colors.green : Colors.red,
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: isDoneColor.shade100.withOpacity(0.5),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextPro(
                          '#CatTask',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isDoneColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: TextPro(
                            task.isDone ? 'Completed' : 'Uncompleted',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextPro(
                      task.title,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      task.body,
                      style: const TextStyle(height: 1.3),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextPro(
                          Util.formatDate(task.createdAt),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),

                        // Update Tasks
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              // change text to previous title and body
                              _titleController.text = task.title;
                              _bodyController.text = task.body;
                              _showEditTask(task);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }

  void _showEditTask(Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextPro(
                'Update Task',
              ),
              SizedBox(
                width: 30,
                height: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    final affectedRows =
                        await context.read<TaskViewModel>().removeTask(task);
                    if (!mounted) return;

                    if (affectedRows == 1) {
                      Fluttertoast.showToast(
                        msg: 'Task Updated !',
                        backgroundColor: Colors.green,
                      );

                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Icon(
                    Icons.delete,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    child: TextField(
                      maxLines: null,
                      controller: _bodyController,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: const TextStyle(
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          actions: [
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const TextPro('Cancel'),
            ),
            TextButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () async {
                task.title = _titleController.text;
                task.body = _bodyController.text;

                final affectedRows =
                    await context.read<TaskViewModel>().updateTask(task);

                if (!mounted) return;

                if (affectedRows == 1) {
                  Fluttertoast.showToast(
                    msg: 'Task Updated !',
                    backgroundColor: Colors.green,
                  );

                  Navigator.pop(context);
                }
              },
              child: const TextPro('Update'),
            ),
          ],
        );
      },
    );
  }
}

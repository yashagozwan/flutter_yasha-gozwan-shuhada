import 'package:flutter/material.dart';
import '../../model/api/task_api.dart';
import '../../model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  String _title = '';
  String _body = '';

  Iterable<Task> _tasks = [];

  Iterable<Task> get tasks => _tasks;

  int _completedTask = 0;
  int _uncompletedTask = 0;
  int _allTaskLength = 0;

  int get completedTask => _completedTask;

  int get uncompletedTask => _uncompletedTask;

  int get allTaskLength => _allTaskLength;

  String get title => _title;

  String get body => _body;

  // Reload jika ada perubahan
  void reloadTaskInfo(int userId) {
    _getAllTaskLength(userId);
    _getTaskUncompleted(userId);
    _getTaskCompleted(userId);
    _getTasks(userId);
  }

  // search Task
  void searchTasks(int userId, String search) async {
    if (search.isEmpty) {
      _getTasks(userId);
      return;
    }

    final tasks = await TaskApi.getAllTaskByUserId(userId);
    final searchTasks = tasks.where(
      (task) => task.title.toLowerCase().contains(search.toLowerCase()),
    );
    _tasks = searchTasks;
    notifyListeners();
  }

  // Delete Task
  Future<int> removeTask(Task task) async {
    final affectedRows = await TaskApi.removeTask(task.id!);
    reloadTaskInfo(task.userId);
    return affectedRows;
  }

  // Update Task
  Future<int> updateTask(Task task) async {
    final affectedRows = await TaskApi.updateTask(task);
    reloadTaskInfo(task.userId);
    return affectedRows;
  }

  // get task
  void _getTasks(int userId) async {
    final tasks = await TaskApi.getAllTaskByUserId(userId);
    _tasks = tasks.toList().reversed;
    notifyListeners();
  }

  void _getTaskCompleted(int userId) async {
    final tasks = await TaskApi.getAllTaskByUserId(userId);
    final completed = tasks.where((task) => task.isDone == true);
    _completedTask = completed.length;
    notifyListeners();
  }

  void _getTaskUncompleted(int userId) async {
    final tasks = await TaskApi.getAllTaskByUserId(userId);
    final uncompleted = tasks.where((task) => task.isDone == false);
    _uncompletedTask = uncompleted.length;
    notifyListeners();
  }

  void _getAllTaskLength(int userId) async {
    final tasks = await TaskApi.getAllTaskByUserId(userId);
    _allTaskLength = tasks.length;
    notifyListeners();
  }

  // Meyimpan text yang sudah di ketik
  // didalam text field
  void titleTemp(String title) {
    _title = title;
    notifyListeners();
  }

  void bodyTemp(String body) {
    _body = body;
    notifyListeners();
  }

  Future<int> createTask(Task task) async {
    return await TaskApi.createTask(task);
  }
}

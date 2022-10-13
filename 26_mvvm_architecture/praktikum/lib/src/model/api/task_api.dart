import '../../service/sqlite_service.dart';
import '../../service/task_table_service.dart';
import '../task_model.dart';

class TaskApi {
  static final TaskTableService _taskTableService = TaskTableService(
    SqliteService(),
  );

  static Future<int> createTask(Task task) async {
    return await _taskTableService.createTask(task);
  }

  static Future<Iterable<Task>> getAllTaskByUserId(int userId) async {
    return await _taskTableService.getAllTaskByUserId(userId);
  }

  static Future<Task?> getTaskById(int id) async {
    return await _taskTableService.getTasksById(id);
  }

  static Future<int> updateTask(Task task) async {
    return await _taskTableService.updateTask(task);
  }

  static Future<int> removeTask(int id) async {
    return await _taskTableService.removeTask(id);
  }
}

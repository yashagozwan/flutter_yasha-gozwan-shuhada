import 'package:sqflite/sqflite.dart';
import '../model/task_model.dart';
import 'sqlite_service.dart';

class TaskTableService {
  static const String _tableTasks = SqliteService.tableTasks;
  final SqliteService _sqliteService;

  TaskTableService(this._sqliteService);

  Future<int> createTask(Task task) async {
    try {
      final db = await _sqliteService.database;
      await db.insert(
        _tableTasks,
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      return 1;
    } catch (error) {
      return 0;
    }
  }

  Future<Iterable<Task>> getAllTask() async {
    try {
      final db = await _sqliteService.database;
      final rawTasks = await db.query(_tableTasks);
      final tasks = rawTasks.map((task) => Task.fromMap(task));
      return tasks;
    } catch (error) {
      rethrow;
    }
  }

  Future<Iterable<Task>> getAllTaskByUserId(int userId) async {
    try {
      final db = await _sqliteService.database;
      final mapTasks = await db.query(
        _tableTasks,
        where: 'userId=?',
        whereArgs: [userId],
      );
      final tasks = mapTasks.map((task) => Task.fromMap(task));
      return tasks;
    } catch (error) {
      rethrow;
    }
  }

  Future<Task?> getTasksById(int id) async {
    try {
      final db = await _sqliteService.database;
      final tasks = await db.query(
        _tableTasks,
        where: 'id=?',
        whereArgs: [id],
      );

      final task = tasks.map((task) => Task.fromMap(task)).first;
      return task;
    } catch (error) {
      return null;
    }
  }

  Future<int> updateTask(Task task) async {
    try {
      final db = await _sqliteService.database;
      final affectedRows = await db.update(
        _tableTasks,
        task.toMap(),
        where: 'id=?',
        whereArgs: [task.id],
      );
      return affectedRows;
    } catch (error) {
      return 0;
    }
  }

  Future<int> removeTask(int id) async {
    try {
      final db = await _sqliteService.database;
      final affectedRows = await db.delete(
        _tableTasks,
        where: 'id=?',
        whereArgs: [id],
      );
      return affectedRows;
    } catch (error) {
      return 0;
    }
  }
}

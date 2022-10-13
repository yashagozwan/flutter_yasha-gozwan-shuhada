import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/model/task_model.dart';
import 'package:praktikum/src/service/sqlite_service.dart';
import 'package:praktikum/src/service/task_table_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Task Table Service', () {
    final taskTableService = TaskTableService(SqliteService());

    test('Create task', () async {
      final task = Task(
        title: 'Buy Dart Book',
        body: 'This book for learning what is dart',
        isDone: false,
        userId: 1,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    });

    test('Get all task', () async {
      final tasks = await taskTableService.getAllTask();
    });

    test('Get all task by userId', () async {
      final tasks = await taskTableService.getAllTaskByUserId(1);
    });

    test('Get task by id', () async {
      final task = await taskTableService.getTasksById(3);
    });

    test('Update task', () async {
      final task = Task(
        id: 1,
        title: 'Buy JavaScript Book',
        body: 'This book for learning what is JavaScript',
        isDone: true,
        userId: 1,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
    });

    test('Remove task', () async {
      final result = await taskTableService.removeTask(1);
    });
  });
}

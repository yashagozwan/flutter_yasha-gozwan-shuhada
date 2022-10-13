import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService {
  static const _databaseName = 'playground_v3.db';
  static const _databaseVersion = 1;

  static Database? _database;
  static const tableUsers = 'users';
  static const tableTasks = 'tasks';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), _databaseName);
    final database = await openDatabase(
      path,
      onCreate: _onCreate,
      version: _databaseVersion,
    );

    return database;
  }

  void _onCreate(Database database, int version) async {
    // users table
    await database.execute(
      '''
        CREATE TABLE $tableUsers(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          firstName TEXT NOT NULL,
          lastName TEXT NOT NULL,
          email TEXT UNIQUE NOT NULL,
          password TEXT NOT NULL
        )
      ''',
    );

    // tasks table
    await database.execute(
      '''
        CREATE TABLE $tableTasks(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          body TEXT NOT NULL,
          isDone INTEGER NOT NULL,
          createdAt INTEGER NOT NULL,
          userId INTEGER NOT NULL
        )
      ''',
    );
  }
}

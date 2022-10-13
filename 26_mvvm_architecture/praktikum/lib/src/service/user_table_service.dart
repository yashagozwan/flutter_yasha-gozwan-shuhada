import 'package:sqflite/sqflite.dart';
import '../model/user_model.dart';
import '../util/hash.dart';
import 'sqlite_service.dart';

class UserTableService {
  static const String _tableUsers = SqliteService.tableUsers;
  final SqliteService _sqliteService;

  UserTableService(this._sqliteService);

  Future<int> createUser(User user) async {
    try {
      final Database db = await _sqliteService.database;
      user.password = Bcrypt.passHash(user.password);
      await db.insert(
        _tableUsers,
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.fail,
      );

      return 1;
    } catch (e) {
      return 0;
    }
  }

  Future<Iterable<User>> getUsers() async {
    try {
      final db = await _sqliteService.database;
      final rawUsers = await db.query(_tableUsers);
      final users = rawUsers.map((e) => User.fromMap(e));
      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      final db = await _sqliteService.database;
      var userMap = await db.query(
        _tableUsers,
        where: 'email=?',
        whereArgs: [email],
      );
      var user = userMap.map((e) => User.fromMap(e)).first;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<int> removeUser(int id) async {
    try {
      final db = await _sqliteService.database;
      var result = await db.delete(_tableUsers, where: 'id=?', whereArgs: [id]);
      return result;
    } catch (e) {
      return 0;
    }
  }
}

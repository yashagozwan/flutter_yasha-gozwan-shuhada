import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/model/user_model.dart';
import 'package:praktikum/src/service/sqlite_service.dart';
import 'package:praktikum/src/service/user_table_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('User Table Service', () {
    final userTableService = UserTableService(SqliteService());

    test('Create User', () async {
      final user = User(
        firstName: 'Yasha',
        lastName: 'Gozwan',
        email: 'yasha@gmail.com',
        password: '123456',
      );

      final result = await userTableService.createUser(user);
    });

    test('Get all users', () async {
      final users = await userTableService.getUsers();
    });

    test('Get user by email', () async {
      final user = await userTableService.getUserByEmail('yasha@gmail.com');
    });

    test('Remove User by id', () async {
      final result = await userTableService.removeUser(2);
    });
  });
}

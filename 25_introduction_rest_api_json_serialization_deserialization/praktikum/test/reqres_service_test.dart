import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/model/user_request_model.dart';
import 'package:praktikum/src/service/reqres_service.dart';

void main() {
  group('ReqRes Service', () {
    final reqresService = ReqResService();

    test('Create User', () async {
      final user = await reqresService.create(
        UserCreate(name: 'Yasha Gozwan', job: 'Ngangur'),
      );
      expect(user, isNotNull);
    });

    test('GET Users', () async {
      final users = await reqresService.getAll();
      expect(users, isNotEmpty);
    });

    test('Patch User', () async {
      final user = await reqresService.update(
        UserUpdate(name: 'Yasha Gozwan', job: 'Mahasiswa'),
      );
      expect(user, isNotNull);
    });

    test('Delete User', () async {
      final result = await reqresService.remove();

      expect(result, isNotNull);
    });
  });
}

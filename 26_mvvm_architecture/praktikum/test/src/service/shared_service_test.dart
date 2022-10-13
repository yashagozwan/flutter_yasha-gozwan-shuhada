import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/model/user_model.dart';
import 'package:praktikum/src/service/shared_service.dart';

void main() {
  group('Shared Service Test', () {
    final shared = SharedService();

    test('SaveAccount must be return bool', () async {
      final user = User(
        id: 10,
        firstName: 'Yasha',
        lastName: 'Gozwan',
        email: 'yasha@empress.com',
        password: '123456',
      );

      final result = await shared.saveUser(user);
      expect(result, isTrue);
      // debugPrint(result.toString());
    });

    test('GetAccount must be return account or null', () async {
      final result = await shared.getUser();
      expect(result, result != null ? isNotNull : isNull);
      // debugPrint(result.toString());
    });

    test('isLoggedIn must be return bool', () async {
      final result = await shared.isLoggedIn();
      expect(result, result ? isTrue : isFalse);
      // debugPrint(result.toString());
    });

    test('RemoveAccount must be return bool', () async {
      final result = await shared.removeUser();
      expect(result, result ? isTrue : isFalse);
      // debugPrint(result.toString());
    });
  });
}

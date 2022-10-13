import 'package:flutter_test/flutter_test.dart';
import 'package:praktikum/src/util/hash.dart';

void main() {
  group('Bcrypt', () {
    test('passHash() mush be return string value', () {
      var result = Bcrypt.passHash('123456');
      expect(result, isNotEmpty);
    });

    test('passVerity() mush be return bool value', () {
      var hashed =
          '\$2a\$12\$WXhvsEWiskAirKuz.YHjFueIj5ELlcBPhO5VcyxEh.mC8GWgqqxq2';
      var result = Bcrypt.passVerify('123456', hashed);
      expect(result, result ? isTrue : isFalse);
    });
  });
}

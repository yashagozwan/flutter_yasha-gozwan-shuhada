import 'package:bcrypt/bcrypt.dart';

class Bcrypt {
  static String passHash(String password) {
    final salt = BCrypt.gensalt();
    final hash = BCrypt.hashpw(password, salt);
    return hash;
  }

  static bool passVerify(String password, String hashed) {
    final isValid = BCrypt.checkpw(password, hashed);
    return isValid;
  }
}

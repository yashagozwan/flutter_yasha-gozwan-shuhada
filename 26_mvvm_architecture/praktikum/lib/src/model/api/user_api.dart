import '../../service/shared_service.dart';
import '../../service/sqlite_service.dart';
import '../../service/user_table_service.dart';
import '../user_model.dart';

class UserApi {
  static final UserTableService _userTableService = UserTableService(
    SqliteService(),
  );
  static final SharedService _sharedService = SharedService();

  static Future<User?> getUserByEmail(String email) async {
    return await _userTableService.getUserByEmail(email);
  }

  static Future<int> createUser(User user) async {
    return await _userTableService.createUser(user);
  }

  static Future<int> removeUser(int id) async {
    return await _userTableService.removeUser(id);
  }

  static Future<bool> saveUserInSharedPreference(User user) async {
    return await _sharedService.saveUser(user);
  }

  static Future<User?> getUserInSharedPreference() async {
    return await _sharedService.getUser();
  }

  static Future<bool> getUserLoggedInSharedPreference() async {
    return await _sharedService.isLoggedIn();
  }

  static Future<bool> removeUerInSharedPreference() async {
    return await _sharedService.removeUser();
  }
}

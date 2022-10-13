import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';
import '../../util/hash.dart';
import '../../model/login_model.dart';
import '../../model/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<User?> login(Login login) async {
    final user = await UserApi.getUserByEmail(login.email);

    // check if user is null
    if (user == null) {
      _user = null;
      notifyListeners();
      return null;
    }

    // check if password valid
    final isValidPassword = Bcrypt.passVerify(
      login.password,
      user.password,
    );

    if (!isValidPassword) {
      _user = null;
      notifyListeners();
      return null;
    }

    // save user to shared preference
    final storeIsSuccess = await UserApi.saveUserInSharedPreference(user);
    if (!storeIsSuccess) {
      _user = null;
      notifyListeners();
      return null;
    }
    _user = user;
    notifyListeners();
    return user;
  }
}

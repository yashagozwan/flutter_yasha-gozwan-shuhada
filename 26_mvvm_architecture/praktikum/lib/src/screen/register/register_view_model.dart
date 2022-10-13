import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';
import '../../model/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  int _affectedRows = 0;

  int get affectedRows => _affectedRows;

  Future<int> register(User user) async {
    final affectedRows = await UserApi.createUser(user);
    _affectedRows = affectedRows;
    notifyListeners();
    return affectedRows;
  }
}

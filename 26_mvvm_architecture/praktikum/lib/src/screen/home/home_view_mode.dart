import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';
import '../../model/user_model.dart';

class HomeViewModel extends ChangeNotifier {
  User? _user;

  int _index = 0;

  User? get user => _user;

  int get index => _index;

  void tapIndex(int index) {
    _index = index;
    notifyListeners();
  }

  Future<User?> getUser() async {
    final user = await UserApi.getUserInSharedPreference();
    _user = user;
    notifyListeners();
    return user;
  }

  Future<bool> logout() async {
    return await UserApi.removeUerInSharedPreference();
  }
}

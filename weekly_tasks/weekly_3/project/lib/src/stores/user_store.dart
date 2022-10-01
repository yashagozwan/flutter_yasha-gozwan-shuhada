import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserStore extends ChangeNotifier {
  final List<UserModel> _users = [];

  List<UserModel> get users => List.unmodifiable(_users);

  void add(UserModel user) {
    _users.add(user);
    notifyListeners();
  }
}

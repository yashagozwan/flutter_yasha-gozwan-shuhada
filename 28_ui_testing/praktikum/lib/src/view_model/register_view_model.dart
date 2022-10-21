import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';

class RegisterNotifier extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  bool _success = false;
  bool get success => _success;

  void _setSuccess() {
    _success = true;
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
    _setSuccess();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}

final registerViewModel = ChangeNotifierProvider<RegisterNotifier>(
  (ref) => RegisterNotifier(),
);

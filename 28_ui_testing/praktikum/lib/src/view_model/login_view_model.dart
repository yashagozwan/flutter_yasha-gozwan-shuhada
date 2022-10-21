import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';
import 'register_view_model.dart';

class LoginNotifier extends ChangeNotifier {
  final User? user;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  LoginNotifier({
    this.user,
  });

  void setSuccess(bool newValue) {
    _isSuccess = newValue;
    notifyListeners();
  }

  void login(String email, String password) {
    if (user == null) {
      setSuccess(false);
      return;
    }

    if (user!.email == email && user!.password == password) {
      setSuccess(true);
    } else {
      setSuccess(false);
    }
  }
}

final loginViewModel = ChangeNotifierProvider<LoginNotifier>((ref) {
  final homeViewModel = ref.watch(registerViewModel);
  return LoginNotifier(user: homeViewModel.user);
});

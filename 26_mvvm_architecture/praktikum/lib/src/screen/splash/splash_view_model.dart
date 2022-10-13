import 'package:flutter/material.dart';
import '../../model/api/user_api.dart';

class SplashViewModel extends ChangeNotifier {
  Future<bool> getLoggedUser() async {
    return UserApi.getUserLoggedInSharedPreference();
  }
}

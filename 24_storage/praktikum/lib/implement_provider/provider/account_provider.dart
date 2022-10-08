import 'package:flutter/material.dart';
import '../../helper/shared_helper.dart';
import '../../model/account_model.dart';

class AccountProvider extends ChangeNotifier {
  bool _isLogin = false;
  AccountModel? _account;
  late SharedHelper _sharedHelper;

  AccountProvider() {
    _sharedHelper = SharedHelper();
  }

  Future<bool> get isLogin async {
    _isLogin = await _sharedHelper.isLogin();
    return _isLogin;
  }

  AccountModel? get account => _account;

  Future<bool> saveAccount(AccountModel account) async {
    final result = await _sharedHelper.saveAccount(account);
    return result;
  }

  Future<void> getAccount() async {
    _account = await _sharedHelper.getAccount();
    notifyListeners();
  }

  Future<bool> removeAccount() async {
    return await _sharedHelper.removeAccount();
  }
}

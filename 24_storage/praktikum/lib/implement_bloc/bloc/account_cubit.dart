import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/shared_helper.dart';
import '../../model/account_model.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  late SharedHelper _sharedHelper;

  AccountCubit() : super(Initial()) {
    _sharedHelper = SharedHelper();
  }

  void getAccount() async {
    var account = await _sharedHelper.getAccount();
    var isLogin = await _sharedHelper.isLogin();
    emit(Success(account: account, isLogin: isLogin));
  }

  Future<bool> removeAccount() async {
    var result = await _sharedHelper.removeAccount();
    getAccount();
    return result;
  }

  Future<bool> createAccount(AccountModel account) async {
    var result = await _sharedHelper.saveAccount(account);
    getAccount();
    return result;
  }
}

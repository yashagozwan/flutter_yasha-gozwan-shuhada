import 'package:shared_preferences/shared_preferences.dart';
import '../model/account_model.dart';

class SharedHelper {
  final String _name = 'name';
  final String _email = 'email';
  final String _phone = 'phone';
  final String _password = 'password';

  Future<bool> saveAccount(AccountModel account) async {
    final store = await SharedPreferences.getInstance();
    final name = await store.setString(_name, account.name);
    final email = await store.setString(_email, account.email);
    final phone = await store.setString(_phone, account.phone);
    final password = await store.setString(_password, account.password);
    if (name && email && phone && password) return true;
    return false;
  }

  Future<AccountModel?> getAccount() {
    return Future(() async {
      final store = await SharedPreferences.getInstance();
      final name = store.getString(_name);
      final email = store.getString(_email);
      final phone = store.getString(_phone);
      final password = store.getString(_password);

      if (name != null && email != null && phone != null && password != null) {
        return AccountModel(name, email, phone, password);
      }

      return null;
    });
  }

  Future<bool> removeAccount() async {
    final store = await SharedPreferences.getInstance();
    final name = await store.remove(_name);
    final email = await store.remove(_email);
    final phone = await store.remove(_phone);
    final password = await store.remove(_password);

    if (name && email && phone && password) return true;
    return false;
  }

  Future<bool> isLogin() async {
    var currentUser = await getAccount();
    if (currentUser != null) return true;
    return false;
  }
}

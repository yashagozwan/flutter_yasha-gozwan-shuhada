import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class SharedService {
  final String _id = 'id';
  final String _firstName = 'firstName';
  final String _lastName = 'lastName';
  final String _email = 'email';
  final String _password = 'password';

  final _shared = SharedPreferences.getInstance();

  Future createNew(
    String name,
    String password,
  ) async {}

  Future<bool> saveUser(User user) async {
    final shared = await _shared;
    final id = await shared.setInt(_id, user.id ?? -1);
    final firstName = await shared.setString(_firstName, user.firstName);
    final lastName = await shared.setString(_lastName, user.lastName);
    final email = await shared.setString(_email, user.email);
    final password = await shared.setString(_password, user.password);

    // check if property success saved in to shared preferences
    if (id && firstName && lastName && email && password) return true;
    return false;
  }

  Future<User?> getUser() async {
    final shared = await _shared;
    final id = shared.getInt(_id);
    final firstName = shared.getString(_firstName);
    final lastName = shared.getString(_lastName);
    final email = shared.getString(_email);
    final password = shared.getString(_password);

    // check all property
    if (id != null &&
        firstName != null &&
        lastName != null &&
        email != null &&
        password != null) {
      final user = User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      return user;
    }

    return null;
  }

  Future<bool> removeUser() async {
    final user = await getUser();
    if (user == null) return false;

    final shared = await _shared;
    final id = await shared.remove(_id);
    final firstName = await shared.remove(_firstName);
    final lastName = await shared.remove(_lastName);
    final email = await shared.remove(_email);
    final password = await shared.remove(_password);

    // check if property success removed in shared preferences
    if (id && firstName && lastName && email && password) return true;
    return false;
  }

  Future<bool> isLoggedIn() async {
    final user = await getUser();

    // check if the account exists
    if (user != null) return true;
    return false;
  }
}

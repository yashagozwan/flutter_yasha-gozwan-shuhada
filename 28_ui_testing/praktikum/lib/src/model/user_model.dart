class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'User(id:$id, firstName:$firstName, lastName:$lastName, email:$email, password:$password)';
  }
}

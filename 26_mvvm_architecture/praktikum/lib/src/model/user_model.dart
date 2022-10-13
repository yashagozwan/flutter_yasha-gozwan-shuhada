class User {
  int? id;
  String firstName;
  String lastName;
  String email;
  String password;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User={id=$id, firstName=$firstName, lastName=$lastName, email=$email, password=$password}';
  }
}

class Contact {
  String name;
  String phone;

  Contact({
    required this.name,
    required this.phone,
  });

  factory Contact.fromJson(dynamic data) {
    return Contact(
      name: data['name'],
      phone: data['phone'],
    );
  }
}

class ContactModel {
  String name;
  String phone;

  ContactModel({
    required this.name,
    required this.phone,
  });

  factory ContactModel.fromJson(dynamic data) {
    return ContactModel(name: data['name'], phone: data['phone']);
  }
}

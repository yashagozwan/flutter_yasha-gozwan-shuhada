class ContactModel {
  final String name;
  final String phone;
  bool globalState;

  ContactModel({
    required this.name,
    required this.phone,
    this.globalState = false,
  });

  static List<ContactModel> listContact = [
    ContactModel(name: 'Yasha Gozwan Shuhada', phone: '+6287875336077'),
    ContactModel(name: 'Tsubasa Hanekawa', phone: '+6287345345334'),
  ];
}

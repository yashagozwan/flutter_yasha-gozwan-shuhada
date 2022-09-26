class ContactModel {
  int id;
  String name;
  String phone;

  ContactModel(
    this.id,
    this.name,
    this.phone,
  );

  factory ContactModel.fromJson(dynamic data) {
    return ContactModel(
      data['id'],
      data['name'],
      data['phone'],
    );
  }
}

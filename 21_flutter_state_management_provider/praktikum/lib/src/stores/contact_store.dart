import 'package:flutter/material.dart';
import '../model/contact_model.dart';

class ContactStore extends ChangeNotifier {
  final _contacts = <ContactModel>[];

  List<ContactModel> get contacts => List.unmodifiable(_contacts);

  void create(ContactModel contact) {
    if (contact.globalState) {
      _contacts.add(contact);
      notifyListeners();
    }
  }

  void remove(ContactModel contact) {
    _contacts.remove(contact);
    notifyListeners();
  }
}

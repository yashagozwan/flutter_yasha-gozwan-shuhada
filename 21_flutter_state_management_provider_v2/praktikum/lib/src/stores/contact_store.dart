import 'package:flutter/material.dart';
import '../model/contact_model.dart';

class ContactStore extends ChangeNotifier {
  final List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => List.unmodifiable(_contacts);

  void create(ContactModel contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(ContactModel contact) {
    _contacts.remove(contact);
    notifyListeners();
  }

  bool findDuplicate(ContactModel contact) {
    final findContact = _contacts.where((element) {
      return element.phone == contact.phone;
    }).toList();

    if (findContact.isEmpty) return false;

    return true;
  }
}

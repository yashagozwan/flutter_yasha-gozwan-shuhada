import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/contact.dart';
import 'contact_item.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final List<Contact> _contacts = [];

  Future<void> _getContact() async {
    print('Running');
    var response = await rootBundle.loadString('assets/contacts.json');
    var rawContacts = jsonDecode(response) as List;
    var contacts = rawContacts.map((e) => Contact.fromJson(e)).toList();
    setState(() => _contacts.addAll(contacts));
  }

  @override
  void initState() {
    _getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _contacts.map((e) {
        return ContactItem(contact: e);
      }).toList(),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/contact_model.dart';
import '../contact_add_page/contact_add_page.dart';
import 'widgets/contact_list.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _contacts = <ContactModel>[];

  Future<void> _setContact() async {
    final response = await rootBundle.loadString('assets/data/contacts.json');
    final rawContacts = jsonDecode(response) as List;
    final contacts =
        rawContacts.map((contact) => ContactModel.fromJson(contact)).toList();
    setState(() => _contacts.addAll(contacts));
  }

  @override
  void initState() {
    super.initState();
    _setContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: ContactList(
        contacts: _contacts.reversed.toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final contact = await Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return const ContactAddPage();
            },
          ));

          setState(() => _contacts.add(contact));
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}

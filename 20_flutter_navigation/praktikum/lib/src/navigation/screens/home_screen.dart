import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum/src/model/contact_model.dart';
import 'package:praktikum/src/navigation/screens/form_contact.dart';
import 'package:praktikum/src/widgets/detail.dart';
import 'package:praktikum/src/widgets/text_pro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _contacts = <ContactModel>[];

  Future<void> _loadContact() async {
    final response = await rootBundle.loadString('assets/data/contacts.json');
    final rawContacts = jsonDecode(response) as List;
    final contacts = rawContacts.map((e) => ContactModel.fromJson(e)).toList();
    setState(() => _contacts.addAll(contacts));
  }

  @override
  void initState() {
    super.initState();
    _loadContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final contact = _contacts[index];
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                ),
                builder: (_) {
                  return Detail(contact: contact);
                },
              );
            },
            leading: Container(
              width: 50,
              alignment: Alignment.center,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: TextPro(
                contact.name[0],
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: IconButton(
              onPressed: () async {
                final updated = await Navigator.push(context, MaterialPageRoute(
                  builder: (_) {
                    return FormContact(
                      contact: contact,
                    );
                  },
                ));

                if (updated == null) return;
                final updatedContact = updated as ContactModel;
                final currentIndex =
                    _contacts.indexOf(_contacts.elementAt(index));
                setState(() {
                  _contacts[currentIndex] = updatedContact;
                });
              },
              icon: const Icon(Icons.edit),
            ),
          );
        },
        separatorBuilder: (_, index) => const Divider(),
        itemCount: _contacts.length,
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () async {
          final contact = await Navigator.push(context, MaterialPageRoute(
            builder: (_) {
              return const FormContact();
            },
          ));

          if (contact == null) return;

          setState(() => _contacts.add(contact));
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Contact'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

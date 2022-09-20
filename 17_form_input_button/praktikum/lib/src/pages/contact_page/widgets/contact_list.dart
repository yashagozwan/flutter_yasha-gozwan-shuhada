import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../contact_detail_page/contact_detail_page.dart';
import '../../../models/contact_model.dart';
import 'contact_item.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
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
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = _contacts[index];
        final color = _getColor();
        return Stack(
          children: [
            ContactItem(contact: contact, color: color),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return ContactDetailPage(
                          contact: contact,
                          color: color,
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Color _getColor() {
    final ran = Random().nextInt(3);
    switch (ran) {
      case 0:
        return Colors.redAccent;
      case 1:
        return Colors.blueAccent;
      case 2:
        return Colors.green;
      default:
        return Colors.deepPurpleAccent;
    }
  }
}

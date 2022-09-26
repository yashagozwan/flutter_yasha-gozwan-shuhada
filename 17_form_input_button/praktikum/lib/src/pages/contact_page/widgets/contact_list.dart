import 'dart:math';
import 'package:flutter/material.dart';
import '../../contact_detail_page/contact_detail_page.dart';
import '../../../models/contact_model.dart';
import 'contact_item.dart';

class ContactList extends StatelessWidget {
  final List<ContactModel> contacts;

  const ContactList({
    Key? key,
    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contacts[index];
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

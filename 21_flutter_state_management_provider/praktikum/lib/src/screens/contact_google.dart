import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contact_model.dart';
import '../stores/contact_store.dart';
import '../widgets/circle_text.dart';


class ContactGoogle extends StatelessWidget {
  const ContactGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactStore = Provider.of<ContactStore>(context);
    return builContact(contactStore.contacts, context);
  }

  Widget builContact(List<ContactModel> contacts, BuildContext context) {
    if (contacts.isEmpty) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: Icon(
          Icons.cloud_off,
          size: 50,
          color: Colors.grey.shade400,
        ),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleText(text: contact.name),
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
          );
        },
        separatorBuilder: (_, index) => const Divider(),
      ),
    );
  }
}

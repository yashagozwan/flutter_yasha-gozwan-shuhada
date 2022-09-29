import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../stores/contact_store.dart';
import 'contact_create_screen.dart';

class ContactScreen extends StatelessWidget {
  static const String route = '/contact_screen';

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contactStore = Provider.of<ContactStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: _buildListContact(contactStore),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            ContactCreateScreen.route,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListContact(ContactStore contactStore) {
    if (contactStore.contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              (Icons.group_outlined),
              size: 40,
            ),
            Text(
              'Your contact is empty',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        final contact = contactStore.contacts[index];
        return ListTile(
          leading: const Icon(Icons.person_pin, size: 30),
          title: Text(contact.name),
          subtitle: Text(contact.phone),
          tileColor: Colors.green.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          trailing: IconButton(
            onPressed: () {
              contactStore.remove(contact);
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (_, index) => const SizedBox(height: 16),
      itemCount: contactStore.contacts.length,
    );
  }
}

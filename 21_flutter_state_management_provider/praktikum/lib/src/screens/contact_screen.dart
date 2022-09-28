import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/contact_model.dart';
import '../stores/contact_store.dart';
import '../widgets/circle_text.dart';
import 'contact_google.dart';

class ContactScreen extends StatefulWidget {
  static const route = 'contact_screen';

  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _contacts = <ContactModel>[...ContactModel.listContact];
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactStore = Provider.of<ContactStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _showBottomSheet,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const ContactGoogle(),
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.contacts),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _contacts.length,
        itemBuilder: (_, index) {
          final contact = _contacts[index];
          return ListTile(
            leading: CircleText(text: contact.name),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    content: ListTile(
                      leading: CircleText(
                        text: contact.name,
                      ),
                      title: Text(contact.name),
                      subtitle: Text(contact.phone),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.call),
                      ),
                    ),
                  );
                },
              );
            },
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            trailing: contact.globalState
                ? Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: () {
                        contact.globalState = false;
                        contactStore.remove(contact);
                      },
                      child: Image.asset(
                        'assets/images/google_icon.png',
                        width: 22,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      contact.globalState = true;
                      contactStore.create(contact);
                    },
                    icon: const Icon(Icons.cloud_off_outlined),
                  ),
          );
        },
        separatorBuilder: (_, index) => const Divider(),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create New Contact',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name can\'t be empty';
                    }

                    if (value.length < 3) {
                      return 'Please input valid name';
                    }
                    return null;
                  },
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    label: const Text('Name'),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number can\'t be empty';
                    }

                    if (value.length < 5) {
                      return 'Please input valid phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  controller: _phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    label: const Text('Phone'),
                    prefixIcon: const Icon(Icons.phone_android),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();

                    if (!isValid) return;

                    final contact = ContactModel(
                      name: _name.text,
                      phone: _phone.text,
                    );

                    _contacts.add(contact);

                    _phone.clear();
                    _name.clear();
                    Navigator.pop(context);

                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

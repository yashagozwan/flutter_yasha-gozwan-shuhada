import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utility/extra_string.dart';
import '../model/contact_model.dart';
import '../stores/contact_store.dart';

class ContactCreateScreen extends StatefulWidget {
  static const String route = '/contact_create_screen';

  const ContactCreateScreen({super.key});

  @override
  State<ContactCreateScreen> createState() => _ContactCreateScreenState();
}

class _ContactCreateScreenState extends State<ContactCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactStore = Provider.of<ContactStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Name'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name cant\'t be empty';
                    }

                    if (value.length < 3) {
                      return 'Name min 3 character length';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Phone Number'),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone number can\'t be empty';
                    }

                    if (value[0] != '+') {
                      return 'First character must be +';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 7),
                ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();

                    if (!isValid) return;

                    final contact = ContactModel(
                      name: _nameController.text.toCapital(),
                      phone: _phoneController.text,
                    );

                    if (contactStore.findDuplicate(contact)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Sorry number is already registered',
                          ),
                        ),
                      );
                      return;
                    }

                    contactStore.create(contact);
                    Navigator.pop(context);
                  },
                  child: const Text('Create Contact'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

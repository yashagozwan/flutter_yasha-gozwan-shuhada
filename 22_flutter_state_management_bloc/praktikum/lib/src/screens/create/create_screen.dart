import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/contact_bloc.dart';
import '../../bloc/contact_event.dart';
import '../../bloc/contact_state.dart';
import '../../model/contact_mode.dart';

class CreateScreen extends StatefulWidget {
  static const String route = '/create_screen';

  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crate Contact'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Name'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Name can\'t be empty';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Phone Number'),
                    prefixIcon: Icon(Icons.call),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return 'Phone Number can\'t be empty';
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        final isValid = _formKey.currentState!.validate();

                        if (!isValid) return;

                        final contact = ContactModel(
                          name: _name.text,
                          phone: _phone.text,
                        );

                        final duplicate = state.contacts
                            .where((e) => e.phone == contact.phone)
                            .isNotEmpty;

                        if (duplicate) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Contact already exist'),
                            ),
                          );

                          return;
                        }

                        context
                            .read<ContactBloc>()
                            .add(CreateContact(contact: contact));

                        return Navigator.pop(context);
                      },
                      child: const Text('Create'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:praktikum/src/model/contact_model.dart';

class _FormContact extends StatefulWidget {
  const _FormContact({Key? key}) : super(key: key);

  @override
  State<_FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<_FormContact> {
  ContactModel? _contact;
  String _title = '';
  String _buttonTitle = '';

  final _formContact = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();


  void _setFieldAndTitle() {
    var contactArgs = ModalRoute.of(context)!.settings.arguments;
    _contact = contactArgs == null ? null : contactArgs as ContactModel;

    if (_contact == null) {
      _title = 'Create New Contact';
      _buttonTitle = 'Save';
    } else {
      _title = 'Edit Contact';
      _buttonTitle = 'Edit';
      var name = _contact?.name;
      var phone = _contact?.phone;
      _nameController.text = name!;
      _phoneController.text = phone!;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _setFieldAndTitle();

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formContact,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                validator: (String? name) {
                  if (name!.isEmpty) {
                    return 'Name cannot be empty';
                  }

                  if (name.length < 3) {
                    return 'name must be longer than 3 characters';
                  }

                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                validator: (String? phone) {
                  if (phone!.isEmpty) {
                    return 'Phone number cannot be empty';
                  }

                  if (phone.length < 8) {
                    return 'Please fill in the correct number';
                  }

                  return null;
                },
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final isValid = _formContact.currentState?.validate() as bool;
                  if (!isValid) return;

                  if (_contact == null) {
                    final newContact = ContactModel(
                      Random().nextInt(10000),
                      _nameController.text,
                      _phoneController.text,
                    );
                    return Navigator.pop(context, newContact);
                  }
                  _contact?.name = _nameController.text;
                  _contact?.phone = _phoneController.text;
                  Navigator.pop(context, _contact);
                },
                child: Text(_buttonTitle),
              )
            ],
          ),
        ),
      ),
    );
  }
}

typedef FormContactRoute = _FormContact;

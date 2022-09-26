import 'dart:math';

import 'package:flutter/material.dart';
import 'package:praktikum/src/model/contact_model.dart';

class FormContact extends StatefulWidget {
  final ContactModel? contact;

  const FormContact({
    Key? key,
    this.contact,
  }) : super(key: key);

  @override
  State<FormContact> createState() => _FormContactState();
}

class _FormContactState extends State<FormContact> {
  String _title = '';
  String _buttonTitle = '';

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formContact = GlobalKey<FormState>();

  void _setFieldAndTitle() {
    if (widget.contact == null) {
      _title = 'Create New Contact';
      _buttonTitle = 'Save';
    } else {
      _title = 'Edit Contact';
      _buttonTitle = 'Edit';
      var name = widget.contact?.name;
      var phone = widget.contact?.phone;
      _nameController.text = name!;
      _phoneController.text = phone!;
    }
  }

  @override
  void initState() {
    super.initState();
    _setFieldAndTitle();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                  if (widget.contact == null) {
                    final newContact = ContactModel(
                      Random().nextInt(10000),
                      _nameController.text,
                      _phoneController.text,
                    );
                    return Navigator.pop(context, newContact);
                  }

                  final contact = widget.contact;
                  contact?.name = _nameController.text;
                  contact?.phone = _phoneController.text;
                  Navigator.pop(context, contact);
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

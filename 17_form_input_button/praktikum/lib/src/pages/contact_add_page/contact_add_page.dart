import 'package:flutter/material.dart';
import 'package:praktikum/src/models/contact_model.dart';

class ContactAddPage extends StatefulWidget {
  const ContactAddPage({Key? key}) : super(key: key);

  @override
  State<ContactAddPage> createState() => _ContactAddPageState();
}

class _ContactAddPageState extends State<ContactAddPage> {
  String _name = "";
  String _phone = "";

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() => _name = _nameController.text);
    });

    _phoneController.addListener(() {
      setState(() => _phone = _phoneController.text);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Contact'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: _name.isNotEmpty && _phone.isNotEmpty
                ? const Icon(Icons.check, size: 34)
                : const Icon(Icons.close, size: 34),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: _name.isNotEmpty ? Colors.redAccent : Colors.grey[400],
              ),
              child: _name.isNotEmpty ? _profileText() : _profileIcon(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Full Name'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Phone'),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      ContactModel(name: _name, phone: _phone),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileText() {
    return Center(
      child: Text(
        _name[0].toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 42,
        ),
      ),
    );
  }

  Widget _profileIcon() {
    return const Icon(
      Icons.person,
      size: 50,
      color: Colors.white,
    );
  }
}

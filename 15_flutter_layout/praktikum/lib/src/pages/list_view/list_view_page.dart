import 'package:flutter/material.dart';
import 'widgets/contact_list.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON LIstView in Flutter'),
      ),
      body: const ContactList(),
    );
  }
}

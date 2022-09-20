import 'package:flutter/material.dart';
import '../contact_add_page/contact_add_page.dart';
import 'widgets/contact_list.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: const ContactList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return const ContactAddPage();
            },
          ));
        },
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}

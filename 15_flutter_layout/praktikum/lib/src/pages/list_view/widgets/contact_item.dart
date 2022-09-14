import 'package:flutter/material.dart';
import '../../../models/contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;

  const ContactItem({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                contact.name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contact.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Text(contact.phone),
            ],
          ),
        ],
      ),
    );
  }
}

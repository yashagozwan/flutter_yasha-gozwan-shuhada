import 'package:flutter/material.dart';
import 'widgets/my_icon_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../models/contact_model.dart';

class ContactDetailPage extends StatelessWidget {
  final ContactModel contact;
  final Color color;

  const ContactDetailPage({
    Key? key,
    required this.contact,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: color,
            ),
            child: Center(
              child: Text(
                contact.name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            contact.phone,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyIconButton(
                color: Colors.deepPurpleAccent,
                icon: const Icon(
                  Icons.call,
                  color: Colors.white,
                ),
                onPressed: () {
                  launchUrlString('tel://${contact.phone}');
                },
              ),
              const SizedBox(width: 10),
              MyIconButton(
                color: Colors.green,
                icon: const Icon(
                  Icons.messenger,
                  color: Colors.white,
                ),
                onPressed: () {
                  launchUrlString('sms://${contact.phone}');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

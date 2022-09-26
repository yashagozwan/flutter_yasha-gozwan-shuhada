import 'package:flutter/material.dart';
import 'package:praktikum/src/model/contact_model.dart';

import 'text_pro.dart';

class Detail extends StatelessWidget {
  final ContactModel contact;

  const Detail({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: TextPro(
              contact.name[0],
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          TextPro(contact.name, fontSize: 24, fontWeight: FontWeight.w600,),
          const SizedBox(height: 8),
          TextPro(contact.phone, fontSize: 18,),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../model/user_model.dart';

class PreviewScreen extends StatelessWidget {
  final UserModel user;

  const PreviewScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dari cc / bcc : ${user.email}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(),
            Text(
              'Nama : ${user.firstName} ${user.lastName}',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const Divider(),
            const Text(
              'Message Kepada Saya :',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              user.message,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

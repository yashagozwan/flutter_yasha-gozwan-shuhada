import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String job;
  final String dateAction;
  final String dateTitle;

  const UserCard({
    super.key,
    required this.name,
    required this.job,
    required this.dateAction,
    required this.dateTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Name : $name',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'Job : $job',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            '$dateTitle : $dateAction',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

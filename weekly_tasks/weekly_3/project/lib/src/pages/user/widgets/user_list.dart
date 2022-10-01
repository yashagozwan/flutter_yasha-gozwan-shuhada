import 'package:flutter/material.dart';
import 'package:project/src/pages/preview/preview_screen.dart';
import 'package:provider/provider.dart';
import '../../../stores/user_store.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userStore = Provider.of<UserStore>(context);

    if (userStore.users.isEmpty) {
      return const Center(
        child: Icon(
          Icons.no_accounts,
          size: 50,
          color: Colors.grey,
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (_, index) {
        final user = userStore.users[index];
        return ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) {
                return PreviewScreen(user: user);
              },
            ));
          },
          leading: const CircleAvatar(
            child: Icon(Icons.email),
          ),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('From : ${user.email}'),
              Text(
                'Message : ${user.message}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          tileColor: Colors.white,
        );
      },
      separatorBuilder: (_, index) => const Divider(),
      itemCount: userStore.users.length,
    );
  }
}

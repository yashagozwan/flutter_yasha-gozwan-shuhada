import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/contact_bloc.dart';
import '../../bloc/contact_event.dart';
import '../../bloc/contact_state.dart';
import '../../widgets/contact_empty.dart';
import '../../widgets/contact_failed.dart';
import '../../widgets/contact_loading.dart';
import '../create/create_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<ContactBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        bloc: dataBloc,
        builder: (context, state) {
          if (state is Loading) return const ContactLoading();

          if (state is Failed) {
            return const ContactFailed();
          }

          if (state.contacts.isEmpty) return const ContactEmpty();

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, index) {
              final contact = state.contacts[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(contact.name[0]),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                tileColor: Colors.green.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                trailing: IconButton(
                  onPressed: () {
                    context
                        .read<ContactBloc>()
                        .add(RemoveContact(contact: contact));
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 16),
            itemCount: state.contacts.length,
          );
        },
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, CreateScreen.route);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(14),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
        ),
        icon: const Icon(Icons.add),
        label: const Text('Create'),
      ),
    );
  }
}

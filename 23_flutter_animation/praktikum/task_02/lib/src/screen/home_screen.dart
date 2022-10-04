import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_02/src/bloc/contact_cubit.dart';
import 'package:task_02/src/model/contact_model.dart';
import 'package:task_02/src/route_transition/slide_route.dart';
import 'package:task_02/src/screen/form_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocBuilder<ContactCubit, List<ContactModel>>(
        builder: (context, state) {
          return BuildContactList(
            contacts: state,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRoute(
              routeName: FormScreen.route,
              page: const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BuildContactList extends StatefulWidget {
  final List<ContactModel> contacts;

  const BuildContactList({
    super.key,
    required this.contacts,
  });

  @override
  State<BuildContactList> createState() => _BuildContactListState();
}

class _BuildContactListState extends State<BuildContactList> {
  final _name = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.group),
            Text('Your Contacts is empty'),
          ],
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        var contact = widget.contacts[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(contact.name[0].toUpperCase()),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phone),
          trailing: IconButton(
            onPressed: () {
              _name.text = contact.name;
              _phone.text = contact.phone;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Update Contact',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<ContactCubit>(context)
                                    .removeContact(contact);
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            label: Text('Name'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.call),
                            filled: true,
                            label: Text('Phone'),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          contact.name = _name.text;
                          contact.phone = _phone.text;

                          BlocProvider.of<ContactCubit>(context)
                              .updateContact(contact);

                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.update),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: widget.contacts.length,
    );
  }
}

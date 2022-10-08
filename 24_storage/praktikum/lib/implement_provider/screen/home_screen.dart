import 'package:flutter/material.dart';
import 'package:praktikum/implement_provider/provider/account_provider.dart';
import 'package:praktikum/implement_provider/screen/register_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _initial() async {
    context.read<AccountProvider>().getAccount();
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 14),
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Consumer<AccountProvider>(
                    builder: (context, value, child) {
                      return Text(
                        'Hello, ${value.account?.name}',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(child: Icon(Icons.email)),
                      const SizedBox(width: 8),
                      Consumer<AccountProvider>(
                        builder: (context, value, child) {
                          return Text(
                            '${value.account?.email}',
                            style: const TextStyle(fontSize: 16),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(child: Icon(Icons.phone)),
                      const SizedBox(width: 8),
                      Consumer<AccountProvider>(
                        builder: (context, value, child) {
                          return Text(
                            '${value.account?.phone}',
                            style: const TextStyle(fontSize: 16),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final result =
                          await context.read<AccountProvider>().removeAccount();

                      if (mounted) {}

                      if (result) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RegisterScreen.route,
                          (route) => false,
                        );
                      }
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

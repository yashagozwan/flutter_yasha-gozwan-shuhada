import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/account_cubit.dart';
import '../bloc/account_state.dart';
import 'register_screen.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
                  BlocBuilder<AccountCubit, AccountState>(
                    builder: (context, state) {
                      if (state is Success) {
                        return Text(
                          'Hello, ${state.account?.name ?? ''}',
                          style: const TextStyle(fontSize: 24),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(child: Icon(Icons.email)),
                      const SizedBox(width: 8),
                      BlocBuilder<AccountCubit, AccountState>(
                        builder: (context, state) {
                          if (state is Success) {
                            return Text(
                              state.account?.email ?? '',
                              style: const TextStyle(fontSize: 16),
                            );
                          }

                          return const SizedBox();
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
                      BlocBuilder<AccountCubit, AccountState>(
                        builder: (context, state) {
                          if (state is Success) {
                            return Text(
                              state.account?.phone ?? '',
                              style: const TextStyle(fontSize: 16),
                            );
                          }

                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      var result =
                          await context.read<AccountCubit>().removeAccount();

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

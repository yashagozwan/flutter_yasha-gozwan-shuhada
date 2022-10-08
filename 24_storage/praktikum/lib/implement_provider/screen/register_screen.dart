import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../provider/account_provider.dart';
import '../../model/account_model.dart';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future<void> _initial() async {
    final isLogin = await context.read<AccountProvider>().isLogin;

    if (mounted) {}

    if (isLogin) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.route,
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Name'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name field not allowed empty';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email field not allowed empty';
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Must be a valid email';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _phone,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Phone'),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone field not allowed empty';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    filled: true,
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.password),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password field not allowed empty';
                    }

                    return null;
                  },
                ),
                Consumer<AccountProvider>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState!.validate();

                        if (!isValid) return;

                        final account = AccountModel(
                          _name.text,
                          _email.text,
                          _phone.text,
                          _phone.text,
                        );

                        final result = await context
                            .read<AccountProvider>()
                            .saveAccount(account);

                        if (mounted) {}

                        if (result) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.route,
                            (route) => false,
                          );
                        }
                      },
                      child: const Text('Sign Up'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

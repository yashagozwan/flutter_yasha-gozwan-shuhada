import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/user_model.dart';
import '../view_model/register_view_model.dart';
import '../widget/input_text.dart';
import '../widget/text_pro.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/svg/twitter.svg',
          height: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const TextPro(
              'Create your account',
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      controller: _firstName,
                      key: const Key('ttfRegisterFirstName'),
                      label: 'First Name',
                    ),
                    const SizedBox(height: 16),
                    InputText(
                      controller: _lastName,
                      key: const Key('ttfRegisterLastName'),
                      label: 'Last Name',
                    ),
                    const SizedBox(height: 16),
                    InputText(
                      controller: _email,
                      key: const Key('ttfRegisterEmail'),
                      label: 'Email',
                    ),
                    const SizedBox(height: 16),
                    InputText(
                      controller: _password,
                      key: const Key('ttfRegisterPassword'),
                      label: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final viewModel = ref.read(registerViewModel);
          return ElevatedButton(
            key: const Key('btnRegister'),
            onPressed: () {
              final user = User(
                id: Random().nextInt(1000),
                firstName: _firstName.text,
                lastName: _lastName.text,
                email: _email.text,
                password: _password.text,
              );
              viewModel.setUser(user);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const TextPro(
              'Register',
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}

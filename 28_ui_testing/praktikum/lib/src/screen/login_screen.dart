import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/input_text.dart';
import '../widget/text_pro.dart';
import '../view_model/login_view_model.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/svg/twitter.svg',
          height: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const TextPro(
              'To get started, first enter your email & password',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.5,
            ),
            const SizedBox(height: 16),
            InputText(
              key: const Key('ttfLoginEmail'),
              controller: _email,
              label: 'Email',
            ),
            const SizedBox(height: 16),
            InputText(
              key: const Key('ttfLoginPassword'),
              controller: _password,
              label: 'Password',
              obscureText: true,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                side: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: const TextPro('Forgot password'),
            ),
            Consumer(
              builder: (context, ref, child) {
                final viewModel = ref.watch(loginViewModel);
                return ElevatedButton(
                  key: const Key('btnLogin'),
                  onPressed: () {
                    final email = _email.text;
                    final password = _password.text;

                    viewModel.login(email, password);

                    if (!viewModel.isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid email or password'),
                        ),
                      );
                    } else {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.route,
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const TextPro(
                    'Log In',
                    color: Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

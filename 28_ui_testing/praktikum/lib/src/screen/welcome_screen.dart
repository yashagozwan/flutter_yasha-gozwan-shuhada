import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/text_pro.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const route = '/welcome_screen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SvgPicture.asset(
          'assets/svg/twitter.svg',
          key: const Key('svgIcon'),
          height: 25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Center(
                child: TextPro(
                  "See what's happening in the world right now.",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/google.svg',
                height: 25,
              ),
              label: const TextPro(
                'Continue with Google',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(8),
              ),
            ),
            Stack(
              children: [
                const Divider(
                  color: Colors.grey,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.black,
                    child: const TextPro(
                      'or',
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              key: const Key('btnCreateAccount'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RegisterScreen.route,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(8),
              ),
              child: const TextPro(
                'Create account',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            const Text.rich(
              TextSpan(
                text: 'By signing up, you agree to our ',
                children: [
                  TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: ', '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: ', and '),
                  TextSpan(
                    text: 'Cookie Use',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: '.'),
                ],
              ),
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 52),
            Row(
              children: [
                const TextPro(
                  'Have an account already? ',
                  color: Colors.grey,
                ),
                GestureDetector(
                  key: const Key('btnTextLogin'),
                  onTap: () => Navigator.pushNamed(
                    context,
                    LoginScreen.route,
                  ),
                  child: const TextPro(
                    'Log in',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/login_model.dart';
import '../home/home_screen.dart';
import '../register/register_screen.dart';
import '../widget/elevated_button_pro.dart';
import '../widget/text_pro.dart';
import '../widget/text_form_field_pro.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _initial() async {}

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/remainder.svg',
                    width: 200,
                  ),
                  const SizedBox(height: 24),
                  const TextPro(
                    'Hello, Welcome Back !',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  const TextPro('Please Sign In for continue'),
                  const SizedBox(height: 16),
                  TextFormFieldPro(
                    controller: _email,
                    label: 'Email',
                    hint: 'example@flutter.com',
                    bottom: 16,
                  ),
                  TextFormFieldPro(
                    controller: _password,
                    label: 'Password',
                    hint: 'Input Password',
                    obscureText: true,
                    bottom: 24,
                  ),
                  ElevatedButtonPro(
                    onPressed: () async {
                      if (_email.text.isEmpty || _password.text.isEmpty) {
                        _showToast(
                          'Email or password cannot be empty',
                          color: Colors.redAccent.shade400,
                        );
                        return;
                      }

                      if (!EmailValidator.validate(_email.text)) {
                        _showToast('Email must be a valid email');
                        return;
                      }

                      final login = Login(
                        email: _email.text,
                        password: _password.text,
                      );

                      final user =
                          await context.read<LoginViewModel>().login(login);

                      if (user == null) {
                        _showToast('Invalid password or email');
                        return;
                      }

                      _showToast('Logged', color: Colors.green);

                      if (mounted) {}
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeScreen.route,
                        (route) => false,
                      );
                    },
                    text: 'Login',
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account ? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                RegisterScreen.route,
                              );
                            },
                        ),
                      ],
                    ),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

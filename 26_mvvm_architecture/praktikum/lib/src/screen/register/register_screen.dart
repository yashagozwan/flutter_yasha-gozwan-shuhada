import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../model/user_model.dart';
import '../widget/text_form_field_pro.dart';
import '../widget/elevated_button_pro.dart';
import '../widget/text_pro.dart';
import 'register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;
  late TextEditingController _password;

  void _initial() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void initState() {
    super.initState();
    _initial();
  }

  @override
  void dispose() {
    super.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextPro(
                    'Hello, Create Account Now!',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  const TextPro('Please Sign Up for continue'),
                  const SizedBox(height: 16),
                  TextFormFieldPro(
                    controller: _firstName,
                    label: 'First Name',
                    hint: 'John',
                    bottom: 16,
                  ),
                  TextFormFieldPro(
                    controller: _lastName,
                    label: 'Last Name',
                    hint: 'Doe',
                    bottom: 16,
                  ),
                  TextFormFieldPro(
                    controller: _email,
                    label: 'Email',
                    hint: 'example@flutter.com',
                    bottom: 16,
                  ),
                  TextFormFieldPro(
                    obscureText: true,
                    controller: _password,
                    label: 'Password',
                    hint: 'Strong Password',
                    bottom: 24,
                  ),
                  ElevatedButtonPro(
                    onPressed: () async {
                      if (_firstName.text.isEmpty) {
                        _showToast('First Name Cannot be Empty');
                        return;
                      }

                      if (_lastName.text.isEmpty) {
                        _showToast('Last Name Cannot be Empty');
                        return;
                      }

                      if (_email.text.isEmpty) {
                        _showToast('Email Cannot be Empty');
                        return;
                      }

                      if (!EmailValidator.validate(_email.text)) {
                        _showToast('Email must be a valid email');
                      }

                      if (_password.text.isEmpty) {
                        _showToast('Password Cannot be Empty');
                        return;
                      }

                      final user = User(
                        firstName: _firstName.text,
                        lastName: _lastName.text,
                        email: _email.text,
                        password: _password.text,
                      );

                      final affectedRows = await context
                          .read<RegisterViewModel>()
                          .register(user);

                      if (affectedRows != 1) {
                        _showToast('Email address already exist');
                        return;
                      }

                      if (mounted) {}

                      _showToast(
                        'Account created !',
                        color: Colors.green,
                      );

                      Navigator.pop(context);
                    },
                    text: 'Register',
                  ),
                  const SizedBox(height: 24),
                  Text.rich(
                    TextSpan(
                      text: "Already have and account ? ",
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
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
    var currentColor = color ?? Colors.redAccent.shade400;
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: currentColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

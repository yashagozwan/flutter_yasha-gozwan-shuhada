import 'package:flutter/material.dart';
import 'package:praktikum/src/screen/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../login/login_screen.dart';
import '../widget/text_pro.dart';
import 'splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/splash_screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _initial() async {
    final isLogged = await context.read<SplashViewModel>().getLoggedUser();
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        if (isLogged) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeScreen.route,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.route,
            (route) => false,
          );
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initial();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1000),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextPro(
                        'Cat',
                        fontSize: 24,
                      ),
                      TextPro(
                        'Task',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SvgPicture.asset(
                    width: 300,
                    'assets/svg/cat.svg',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

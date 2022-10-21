import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../view_model/register_view_model.dart';
import '../widget/text_pro.dart';
import 'welcome_screen.dart';

import 'dart:developer' as devtools show log;

extension Logger on Object {
  void log() {
    devtools.log(toString());
  }
}

class HomeScreen extends ConsumerWidget {
  static const route = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(registerViewModel);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xff16202A),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextPro(
                            '${viewModel.user?.firstName} ${viewModel.user?.lastName}',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            key: const Key('textName'),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              TextPro(
                                '@${viewModel.user?.firstName}',
                                color: Colors.grey,
                                key: const Key('textUsername'),
                              ),
                              const TextPro(
                                ' • ',
                                color: Colors.grey,
                              ),
                              TextPro(
                                '${viewModel.user?.email}',
                                color: Colors.grey,
                                key: const Key('textEmail'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svg/twitter.svg',
                    height: 25,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const TextPro(
                'Hello Flutter UI Testing 🔥',
                color: Colors.white,
                fontSize: 18,
              ),
              const SizedBox(height: 8),
              const TextPro(
                '#testing',
                color: Colors.blue,
                fontSize: 18,
              ),
              const SizedBox(height: 16),
              const TextPro(
                '8:30 PM • 21 October 2022',
                color: Colors.grey,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                key: const Key('btnLogout'),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    WelcomeScreen.route,
                    (route) => false,
                  );
                  viewModel.clearUser();
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

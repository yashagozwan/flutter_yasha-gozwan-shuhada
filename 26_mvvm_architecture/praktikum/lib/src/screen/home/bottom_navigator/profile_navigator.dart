import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../task/task_view_model.dart';
import '../../login/login_screen.dart';
import '../../widget/text_pro.dart';
import '../home_view_mode.dart';

class ProfileNavigator extends StatefulWidget {
  const ProfileNavigator({super.key});

  @override
  State<ProfileNavigator> createState() => _ProfileNavigatorState();
}

class _ProfileNavigatorState extends State<ProfileNavigator> {
  void _initial() async {
    final user = await context.read<HomeViewModel>().getUser();
    if (user == null) return;
    final userId = user.id!;
    if (!mounted) return;
    context.read<TaskViewModel>().reloadTaskInfo(userId);
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
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Stack(
          children: [
            // Image.asset(
            //   'assets/images/background_profile.jpg',
            //   height: 200,
            //   width: MediaQuery.of(context).size.width,
            //   fit: BoxFit.cover,
            // ),

            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade300,
                    Colors.blue.shade50,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const TextPro('Logout ?'),
                          content: SvgPicture.asset(
                            'assets/svg/break_time.svg',
                            width: 200,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const TextPro('No'),
                            ),
                            TextButton(
                              onPressed: () async {
                                final result = await context
                                    .read<HomeViewModel>()
                                    .logout();

                                if (!mounted) return;

                                if (result) {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    LoginScreen.route,
                                    (route) => false,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const TextPro('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Icon(Icons.logout),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/cat.jpg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 270),
          ],
        ),
        const SizedBox(height: 24),
        Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return Column(
              children: [
                TextPro(
                  '${value.user?.firstName} ${value.user?.lastName}',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                TextPro(
                  '${value.user?.email}',
                  fontSize: 16,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        Consumer(
          builder: (context, value, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              child: Consumer<TaskViewModel>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextPro(
                          'Completed ${value.completedTask}',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextPro(
                          'Uncompleted ${value.uncompletedTask}',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextPro(
                          'Task ${value.allTaskLength}',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

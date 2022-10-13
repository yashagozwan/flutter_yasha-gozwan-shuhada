import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../task/task_screen.dart';
import 'bottom_navigator/home_navigator.dart';
import 'bottom_navigator/profile_navigator.dart';
import 'home_view_mode.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    context.read<HomeViewModel>().tapIndex(index);
  }

  final _widgetOptions = const [
    HomeNavigator(),
    TaskScreen(),
    ProfileNavigator(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (_, value, __) {
          return _widgetOptions.elementAt(value.index);
        },
      ),
      bottomNavigationBar: Consumer<HomeViewModel>(
        builder: (_, value, __) {
          return BottomNavigationBar(
            currentIndex: value.index,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
          );
        },
      ),
    );
  }
}

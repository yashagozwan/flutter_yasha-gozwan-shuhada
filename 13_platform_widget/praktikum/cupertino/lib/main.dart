import 'package:cupertino/screens/chats_screen.dart';
import 'package:cupertino/util/my_colors.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Widget> tabs = [
    const Center(child: Text('Contacts')),
    const Center(child: Text('Calls')),
    const ChatsScreen(),
    const Center(child: Text('Settings')),
  ];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Padding(
              padding: EdgeInsets.only(
                top: 12,
              ),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: MyColors.blue,
                ),
              )),
          middle: Text('Chats'),
          trailing: Icon(CupertinoIcons.arrow_down_right_square),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: 'Settings',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            return tabs[index];
          },
        ),
      ),
    );
  }
}

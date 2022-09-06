import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material/data/chat_list.dart';
import 'package:material/data/menu_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Telegram'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          String image = chatList[index].image;
          String title = chatList[index].title;
          String subtitle = chatList[index].subtitle;
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(title),
            subtitle: Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(getTimeNow()),
          );
        },
        itemCount: chatList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }

  String getTimeNow() {
    return "${DateFormat.Hm().format(DateTime.now())} PM";
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/drawer_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'images/profile.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'John Weeks',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '+6281315467648',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8)
              ],
            ),
          ),
          ...menuList1.map((menu) {
            return ListTile(
              leading: menu.icon,
              title: Text(menu.title),
            );
          }),
          const SizedBox(height: 16),
          ...menuList2.map((menu) {
            return ListTile(
              leading: menu.icon,
              title: Text(menu.title),
            );
          }),
        ],
      ),
    );
  }
}

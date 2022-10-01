import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerPro extends StatelessWidget {
  const DrawerPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://badoystudio.com/wp-content/uploads/2020/01/coding-bootcamp.png',
                ),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.network(
                            width: 30,
                            'https://www.scottbrady91.com/img/logos/dart.svg',
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: SvgPicture.network(
                            width: 30,
                            'https://raw.githubusercontent.com/dnfield/flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg?sanitize=true',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: const Color(0xFF7067DA),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.domain),
            title: const Text('About Us'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: const Color(0xFF7067DA),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Carrier'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: const Color(0xFF7067DA),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: const Color(0xFF7067DA),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
              color: const Color(0xFF7067DA),
            ),
          ),
        ],
      ),
    );
  }
}

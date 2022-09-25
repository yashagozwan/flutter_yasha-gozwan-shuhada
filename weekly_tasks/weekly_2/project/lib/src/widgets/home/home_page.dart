import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/src/widgets/home/widgets/content.dart';
import 'package:project/src/widgets/home/widgets/drawer_pro.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.rotate(
          angle: -0.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SvgPicture.asset(
              'assets/svg/koi.svg',
              width: 40,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.grey.shade700,
                ),
              );
            },
          ),
        ],
      ),
      body: const Content(),
      endDrawer: const DrawerPro(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: '',
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            tooltip: '',
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            tooltip: '',
            label: '',
          ),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

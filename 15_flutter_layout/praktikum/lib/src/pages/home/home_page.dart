import 'package:flutter/material.dart';
import '../../utils/navigate.dart';
import '../grid_view/grid_view_page.dart';
import '../list_view/list_view_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigate(context).start(const ListViewPage());
              },
              child: const Text('Task 1 - ListView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigate(context).start(const GridViewPage());
              },
              child: const Text('Task 2 - GridView'),
            ),
          ],
        ),
      ),
    );
  }
}

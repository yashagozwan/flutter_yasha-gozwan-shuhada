import 'package:flutter/material.dart';
import 'package:praktikum/src/pages/home/widgets/text_pro.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextPro(
            'Welcome to The Dungeon of Black Company Wiki',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          Divider(),
          TextPro(
            'Welcome to the The Dungeon of Black Company Wiki, a Wiki dedicated to everything about the anime & manga series The Dungeon of Black Company (迷宮ブラックカンパニー, Meikyuu Black Company) that anyone can edit. Please help us by creating or editing any of our articles!',
          ),
        ],
      ),
    );
  }
}

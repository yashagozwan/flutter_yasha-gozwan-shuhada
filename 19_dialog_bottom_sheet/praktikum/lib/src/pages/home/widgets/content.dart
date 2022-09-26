import 'package:flutter/material.dart';
import 'package:praktikum/src/pages/home/widgets/header.dart';
import 'package:praktikum/src/pages/home/widgets/section_one.dart';
import 'package:praktikum/src/pages/home/widgets/section_two.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          Header(),
          SizedBox(height: 16),
          SectionOne(),
          SizedBox(height: 16),
          SectionTwo(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

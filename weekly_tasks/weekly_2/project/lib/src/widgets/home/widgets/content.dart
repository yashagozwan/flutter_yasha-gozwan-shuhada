import 'package:flutter/material.dart';
import 'package:project/src/widgets/home/widgets/header.dart';
import 'package:project/src/widgets/home/widgets/section_four.dart';
import 'package:project/src/widgets/home/widgets/section_one.dart';
import 'package:project/src/widgets/home/widgets/section_three.dart';
import 'package:project/src/widgets/home/widgets/section_two.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        children: const [
          Header(),
          SizedBox(height: 32),
          SectionFour(),
          SizedBox(height: 32),
          SectionOne(),
          SizedBox(height: 32),
          SectionTwo(),
          SizedBox(height: 32),
          SectionThree(),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}

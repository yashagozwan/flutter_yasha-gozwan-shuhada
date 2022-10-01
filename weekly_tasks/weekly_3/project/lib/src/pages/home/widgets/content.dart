import 'package:flutter/material.dart';
import 'section_four.dart';
import 'section_one.dart';
import 'section_three.dart';
import 'header.dart';
import 'section_two.dart';

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

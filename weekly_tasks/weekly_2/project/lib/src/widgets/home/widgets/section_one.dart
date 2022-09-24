import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Bersama Practicum, sebuah bootcamp online berorientasi praktik yang ditujukan untuk perubahan & upgrade karir',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Divider(),
        ),
        const SizedBox(height: 16),
        const Text(
          'Carrier',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            'assets/svg/google_svg.svg',
            'assets/svg/facebook_svg.svg',
            'assets/svg/twitter_svg.svg',
          ].map((e) {
            return Container(
              padding: const EdgeInsets.all(16),
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade50,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(10, 10),
                      color: Colors.grey.shade200,
                    )
                  ]),
              child: SvgPicture.asset(e),
            );
          }).toList(),
        ),
      ],
    );
  }
}

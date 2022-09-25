import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/src/widgets/home/model/course_model.dart';

class SectionThree extends StatelessWidget {
  const SectionThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          const Text(
            'About Us',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
          const SizedBox(height: 16),
          const Text(
            'Kamu bisa menjadi Software Engineer. Pilih profesi yang paling cocok untukmu. Dan kami akan berusaha semaksimal mungkin memastikan supaya kamu menikmati pembelajaran dan pekerjaan masa depanmu setiap harinya.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ..._courses(),
        ],
      ),
    );
  }

  List<Widget> _courses() {
    return courseList.map((e) {
      return Card(
        color: e.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white.withOpacity(.2)),
                    onPressed: () {},
                    child: Text(e.month),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white.withOpacity(.2)),
                    onPressed: () {},
                    child: Text(e.startMonth),
                  ),
                ],
              ),
              SvgPicture.network(e.urlImage),
              Text(
                e.title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                e.desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text(
                  e.titleButton,
                  style: TextStyle(color: e.color),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}

import 'package:flutter/material.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Kamu bisa mendapatkan profesi baru',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tanpa meninggalkan rumah',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                'Kami memilih format bootcamp karena ia cepat dan efisien. Tapi semua proses pembelajaran dibuat online sehingga kamu bisa mempelajari profesi baru tanpa meninggalkan meja kerja.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://ik.imagekit.io/dwyazn7ig/alterra_gif/flutter_code.gif?ik-sdk-version=javascript-1.4.3&updatedAt=1664025009184',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://practicum.com/id-idn/tild6663-6535-4331-b665-303564333266__cards_1.jpg',
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Siap memasuki pasar kerja',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bootcamp Practicum bertujuan membentuk kamu sebagai seorang profesional. Dengan portofolio kuat dan skill yang mumpuni, kamu siap masuk pasar kerja dengan kompetitif dan menarik minat perusahaan.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CourseModel {
  final String month;
  final String startMonth;
  final String urlImage;
  final String title;
  final String desc;
  final String titleButton;
  final Color color;

  CourseModel(
    this.month,
    this.startMonth,
    this.urlImage,
    this.title,
    this.desc,
    this.titleButton,
    this.color,
  );
}

final courseList = [
  CourseModel(
    '10 Bulan',
    'Dari 19 September',
    'https://practicum.com/id-idn/tild3061-6537-4165-b633-336139363363__ill-wd.svg',
    'Web Developer',
    'Kembangkan website dan aplikadi web dan bantu usaha tubuh dan memuaskan pengguna',
    'Pelajari lebih lanjur',
    const Color(0xFF7067DA),
  ),
  CourseModel(
    '10 Bulan',
    'Dari 19 September',
    'https://practicum.com/id-idn/tild3630-3365-4732-a366-353333336562__ill-da.svg',
    'Data Analyst',
    'Ungkapan pola dan visualisaikan data untuk membantu perusahaan membuat keputusan berbasis data',
    'Pelajari lebih lanjur',
    const Color(0xFF64CB75),
  ),
  CourseModel(
    '10 Bulan',
    'Dari 19 September',
    'https://practicum.com/id-idn/tild6538-3665-4365-b261-346337303832__ill-ds.svg',
    'Data Scientist',
    'Automasi analisis dan buat prediksi dengan model dan algoritma machine learning',
    'Pelajari lebih lanjur',
    const Color(0xF774DAC1),
  ),
];

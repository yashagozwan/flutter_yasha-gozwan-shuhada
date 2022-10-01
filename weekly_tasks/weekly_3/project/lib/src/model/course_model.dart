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

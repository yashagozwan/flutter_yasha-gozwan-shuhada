import 'dart:io';
import 'package:flutter/material.dart';

class PostModel {
  final File fileImage;
  final DateTime dateTime;
  final Color color;
  final String text;

  const PostModel({
    required this.fileImage,
    required this.dateTime,
    required this.color,
    required this.text,
  });
}

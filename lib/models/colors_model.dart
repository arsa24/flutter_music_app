import 'package:flutter/material.dart';

class ColorsModel {
  final Color primary;
  final Color secondary;
  final Color ternary;

  final Color text;
  final Color hintText;

  final Color unselectedIcon;

  ColorsModel({
    required this.hintText,
    required this.primary,
    required this.secondary,
    required this.ternary,
    required this.text,
    required this.unselectedIcon,
  });
}

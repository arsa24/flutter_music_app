import 'package:music_flutter_app/models/colors_model.dart';
import 'package:flutter/material.dart';

class ColorsConstant {
  static ColorsModel light = ColorsModel(
    primary: Color(0xFFFFFFFF),
    secondary: Color(0xFFF0F0F0),
    ternary: Color(0xFF34D1BF),
    text: Color(0xFF000000),
    hintText: Color(0xFF757575),
    unselectedIcon: Color(0xFFBDBDBD)
  );

  static ColorsModel dark = ColorsModel(
    primary: Color(0xFF070707),
    secondary: Color(0xFF101010),
    ternary: Color(0xFF34D1BF),
    text: Color(0xFFFFFFFF),
    hintText: Color(0xFFFAFAFA),
    unselectedIcon: Color(0xFFBDBDBD)
  );
}

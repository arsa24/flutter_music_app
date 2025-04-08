import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/constants/theme_constant.dart';

class StylesConstant {
  final BuildContext context;
  StylesConstant({required this.context});

  textStyle({
    Color? color,
    double? size = 12,
    FontWeight? weight = FontWeight.w600,
  }) => GoogleFonts.oxygen(
    color: color ?? ThemeConstant.text(context),
    fontWeight: weight,
    fontSize: size,
  );
}

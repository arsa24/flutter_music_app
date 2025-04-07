import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/constants/colors_constant.dart';

class ThemeConstant {
  // dark theme
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsConstant.dark.primary,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.oxygen(
        fontWeight: FontWeight.w700,
      ),
      backgroundColor: ColorsConstant.dark.primary,
      foregroundColor: ColorsConstant.dark.text,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorsConstant.dark.ternary,
      unselectedItemColor: ColorsConstant.dark.unselectedIcon,
    ),
    textTheme: GoogleFonts.oxygenTextTheme(),
  );

  // light theme
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsConstant.light.primary,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsConstant.light.primary,
      foregroundColor: ColorsConstant.light.text,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: ColorsConstant.light.ternary,
      unselectedItemColor: ColorsConstant.light.unselectedIcon,
    ),
    textTheme: GoogleFonts.oxygenTextTheme(),
  );

  // getter color
  static Color primary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.primary
        : ColorsConstant.light.primary;
  }

  static Color text(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.text
        : ColorsConstant.light.text;
  }

  static Color hintText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.hintText
        : ColorsConstant.light.hintText;
  }

  static Color ternary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.ternary
        : ColorsConstant.light.ternary;
  }

  static Color secondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.secondary
        : ColorsConstant.light.secondary;
  }

  static Color unselectedIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? ColorsConstant.dark.unselectedIcon
        : ColorsConstant.light.unselectedIcon;
  }
}

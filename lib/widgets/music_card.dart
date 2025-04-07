import 'package:google_fonts/google_fonts.dart';
import 'package:music_flutter_app/constants/theme_constant.dart';
import 'package:music_flutter_app/models/music_card_model.dart';
import 'package:flutter/material.dart';

Widget musicCard({
  required MusicCardModel props,
  required BuildContext context,
}) => GestureDetector(
  onTap: () {},
  child: ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    leading:
        props.imgCover != null
            ? Image.memory(props.imgCover!)
            : Icon(Icons.music_note),
    title: Text(
      props.title,
      style: GoogleFonts.oxygen(
        color: ThemeConstant.text(context),
        fontWeight: FontWeight.w600,
      ),
    ),
    subtitle: Text(
      props.artist,
      style: GoogleFonts.oxygen(
        color: ThemeConstant.hintText(context),
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    ),
  ),
);

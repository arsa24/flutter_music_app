import 'dart:typed_data';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/models/music_card_model.dart';
import 'package:music_flutter_app/widgets/music_card.dart';
import 'package:on_audio_query/on_audio_query.dart';

Widget homeTracklistView({
  required List<SongModel> props,
  required List<Uint8List?> artworks,
  double? x,
  double? y,
}) => ListView.separated(
  padding: EdgeInsets.symmetric(horizontal: x ?? 16, vertical: y ?? 0),
  separatorBuilder: (context, index) => Gap(12),
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: props.length,
  itemBuilder:
      (context, index) => musicCard(
        props: MusicCardModel(
          artist: props[index].artist ?? "Unknown",
          title: props[index].title,
          uri: props[index].uri ?? "Unknown",
          imgCover: artworks[index],
        ),
        context: context,
      ),
);

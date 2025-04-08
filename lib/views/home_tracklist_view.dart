import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/models/music_card_model.dart';
import 'package:music_flutter_app/widgets/music_card.dart';

final List<MusicCardModel> audios = [
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "titletitle titlevvtitle titletitle title", uri: "uri"),
  MusicCardModel(artist: "artist", title: "title", uri: "uri"),
];

Widget homeTracklistView({double? x, double? y}) => ListView.separated(
  padding: EdgeInsets.symmetric(horizontal: x ?? 16, vertical: y ?? 0),
  separatorBuilder: (context, index) => Gap(12),
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: audios.length,
  itemBuilder:
      (context, index) => musicCard(props: audios[index], context: context),
);

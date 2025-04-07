import 'dart:typed_data';

class MusicCardModel {
  final String title;
  final String artist;
  final String uri;
  final Uint8List? imgCover;

  MusicCardModel({
    required this.artist,
    this.imgCover,
    required this.title,
    required this.uri,
  });
}

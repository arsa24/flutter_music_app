import 'package:music_flutter_app/widgets/music_card.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/models/music_card_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MusicCardModel> musics = [
      MusicCardModel(
        artist: "Lemon",
        path: "path",
        title: "Crazy for You",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "RADWIMPS",
        path: "path",
        title: "Sparkle",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Mika Nakashima",
        path: "path",
        title: "Kiss of Death",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Nakanoke no Itsutsugo",
        path: "path",
        title: "Gotoubun no Katachi",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Nakanoke no Itsutsugo",
        path: "path",
        title: "Gotoubun no Kimochi",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Iris",
        path: "path",
        title: "Re:Call",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Tachibana Mikari",
        path: "path",
        title: "Watch Me",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Mika Nakashima",
        path: "path",
        title: "Kiss of Death",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Nakanoke no Itsutsugo",
        path: "path",
        title: "Gotoubun no Katachi",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Nakanoke no Itsutsugo",
        path: "path",
        title: "Gotoubun no Kimochi",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Iris",
        path: "path",
        title: "Re:Call",
        uri: "uri",
      ),
      MusicCardModel(
        artist: "Tachibana Mikari",
        path: "path",
        title: "Watch Me",
        uri: "uri",
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView.builder(
        itemBuilder:
            (context, index) =>
                musicCard(props: musics[index], context: context),
        itemCount: musics.length,
      ),
    );
  }
}

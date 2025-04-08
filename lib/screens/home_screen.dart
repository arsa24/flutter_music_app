import 'package:music_flutter_app/widgets/view_header.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/views/home_tracklist_view.dart';
import 'package:music_flutter_app/views/home_playlist_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            viewHeader(title: "Playlist", context: context),
            homePlaylistView(),
            viewHeader(title: "Track List", context: context),
            homeTracklistView(),
          ],
        ),
      ),
    );
  }
}

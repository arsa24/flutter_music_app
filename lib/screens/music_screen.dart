import 'package:music_flutter_app/controllers/spotify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicScreen extends StatelessWidget {
  MusicScreen({super.key});
  final spotifyController = Get.put(SpotifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music")),
      body: FutureBuilder(
        future: spotifyController.searchQuery(query: "selamat tinggal"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.spotify.isEmpty) {
            return const Center(child: Text("Tidak ditemukan"));
          }
          return Text(snapshot.data!.spotify[0].title);
        },
      ),
    );
  }
}

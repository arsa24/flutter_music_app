import 'package:get/get.dart';
import 'package:music_flutter_app/controllers/storage_controller.dart';
import 'package:music_flutter_app/widgets/music_card.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/models/music_card_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<StorageController>();
    final audios = audioController.audios;

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async => audioController.audioQuery,
          child: ListView.builder(
            itemBuilder:
                (context, index) => musicCard(
                  props: MusicCardModel(
                    artist: audios[index].artist ?? "Unknown",
                    imgCover: audioController.artworks[index],
                    title: audios[index].title,
                    uri: audios[index].uri ?? "Unknown",
                  ),
                  context: context,
                ),
            itemCount: audios.length,
          ),
        ),
      ),
    );
  }
}

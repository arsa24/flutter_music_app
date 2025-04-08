import 'package:get/get.dart';
import 'package:music_flutter_app/controllers/permission_controller.dart';
import 'package:music_flutter_app/controllers/storage_controller.dart';
import 'package:music_flutter_app/widgets/view_header.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/views/home_tracklist_view.dart';
import 'package:music_flutter_app/views/home_playlist_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<StorageController>();
    final permissionController = Get.find<PermissionController>();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Obx(() {
        if (!permissionController.isGranted.value) {
          return Center(child: Text("Izin belum diberikan"));
        }

        if (!audioController.isLoad.value) {
          audioController.getSongs();
          return Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: () => audioController.getSongs(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                viewHeader(title: "Playlist", context: context),
                homePlaylistView(),
                viewHeader(title: "Track List", context: context),
                homeTracklistView(
                  props: audioController.songs,
                  artworks: audioController.artworks,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

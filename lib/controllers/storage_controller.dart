import 'dart:typed_data';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  RxList<SongModel> songs = <SongModel>[].obs;
  RxList<Uint8List?> artworks = <Uint8List?>[].obs;
  RxBool isLoad = false.obs;

  final audioQuery = OnAudioQuery();

  Future<void> getSongs() async {
    if (isLoad.value) return;
    final get = await audioQuery.querySongs(
      sortType: SongSortType.DISPLAY_NAME,
      orderType: OrderType.ASC_OR_SMALLER,
    );

    final getMusicOnly = get.where((e) => e.isMusic == true).toList();

    final getArtworks = await Future.wait(
      getMusicOnly.map((e) => audioQuery.queryArtwork(e.id, ArtworkType.AUDIO)),
    );

    artworks.value = getArtworks;

    songs.value = getMusicOnly;
    isLoad.value = true;
  }
}

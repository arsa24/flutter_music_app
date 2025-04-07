import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class StorageController extends GetxController {
  RxList audios = [].obs;
  RxList artworks = [].obs;

  final audioQuery = OnAudioQuery();
  final box = GetStorage();

  @override
  void onInit() {
    permissionHandler();
    getAudios();

    audios.value = box.read("audios") ?? [];

    super.onInit();
  }

  void getAudios() async {
    final getAudios = await audioQuery.querySongs();
    audios.value = getAudios;

    final fetchArtwork = await Future.wait(
      getAudios.map(
        (audio) => audioQuery.queryArtwork(audio.id, ArtworkType.AUDIO),
      ),
    );

    artworks.value = fetchArtwork;

    box.write("audios", getAudios);
  }

  void permissionHandler() async {
    final permission = Permission.storage;
    if (await permission.isDenied) {
      await permission.request();
    }
  }
}

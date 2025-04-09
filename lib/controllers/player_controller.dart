import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_flutter_app/models/music_card_model.dart';

class PlayerController extends GetxController {
  RxBool isLastPlayingExist = false.obs;
  RxBool isPlay = false.obs;
  RxDouble maxDuration = 0.0.obs;
  RxDouble position = 0.0.obs;
  Rx<MusicCardModel> currentPlaying =
      MusicCardModel(artist: "", title: "", uri: "", imgCover: null).obs;

  final player = AudioPlayer();
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    player.playerStateStream.listen((state) {
      isPlay.value = state.playing;
    });

    listenToProgress();
  }

  void listenToProgress() {
    player.positionStream.listen((current) {
      final total = player.duration;
      if (total != null && total.inMilliseconds > 0) {
        position.value = current.inMilliseconds / total.inMilliseconds;
      } else {
        position.value = 0.0;
      }
    });
  }

  Future<void> playNewAudio({required MusicCardModel props}) async {
    try {
      currentPlaying.value = props;

      final durationResult = await player.setAudioSource(
        AudioSource.uri(Uri.parse(props.uri)),
      );

      if (durationResult == null) {
        Get.snackbar("Error", "Gagal memuat audio.");
        return;
      }

      maxDuration.value = durationResult.inSeconds.toDouble();
      await player.play();
    } catch (e) {
      Get.snackbar("Error", "Gagal memutar lagu: $e");
    }
  }

  void resumeAudio() async {
    await player.play();
  }
}

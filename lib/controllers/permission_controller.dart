import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var isGranted = false.obs;

  @override
  void onInit() {
    super.onInit();
    handlePermission();
  }

  Future<void> handlePermission() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      // Android 13 >
      final audio = await Permission.audio.request();
      isGranted.value = audio.isGranted;
    } else if (sdkInt >= 30) {
      // Android 11 - 12
      final result = await Permission.manageExternalStorage.request();
      isGranted.value = result.isGranted;
    } else {
      // Android 10 <
      final result = await Permission.storage.request();
      isGranted.value = result.isGranted;
    }
  }
}

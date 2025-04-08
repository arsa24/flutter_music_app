import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var isGranted = false.obs;

  @override
  void onInit() {
    handlePermission();
    super.onInit();
  }

  handlePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      isGranted.value = true;
    } else {
      var perm = await Permission.storage.request();

      if (perm.isGranted) {
        isGranted.value = true;
      } else if (perm.isPermanentlyDenied) {
        Get.defaultDialog(
          title: "Izin diperlukan",
          middleText: "Aktifkan izin penyimpanan secara manual di pengaturan.",
          textConfirm: "Buka Pengaturan",
          textCancel: "Batal",
          onConfirm: () {
            openAppSettings();
            Get.back();
          },
        );
      } else {
        isGranted.value = false;
      }
    }
  }
}

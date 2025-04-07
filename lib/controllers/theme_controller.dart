import "package:get_storage/get_storage.dart";
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  RxBool isDark = false.obs;

  @override
  void onInit() {
    isDark.value = box.read('theme') ?? false;
    super.onInit();
  }

  toggleDarkMode() {
    isDark.value = !isDark.value;
    box.write('theme', isDark.value);
  }
}

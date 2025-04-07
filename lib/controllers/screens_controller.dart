import "package:get/get.dart";

class ScreensController extends GetxController {
  var currentScreen = 0.obs;

  void onNavItemTap(int v) => currentScreen.value = v;
}

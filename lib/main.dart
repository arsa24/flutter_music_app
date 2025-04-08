import 'package:music_flutter_app/controllers/permission_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:music_flutter_app/controllers/theme_controller.dart';
import 'package:music_flutter_app/screens/root_screens.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/constants/theme_constant.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(PermissionController());

  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => GetMaterialApp(
        theme:
            themeController.isDark.value
                ? ThemeConstant.dark
                : ThemeConstant.light,
        home: RootScreens(),
      ),
    );
  }
}

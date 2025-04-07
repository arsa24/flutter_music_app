import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter_app/controllers/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Center(child: Text("Settings")),
      floatingActionButton: FloatingActionButton(
        onPressed: themeController.toggleDarkMode,
        child: Icon(Icons.rotate_90_degrees_ccw_sharp),
      ),
    );
  }
}

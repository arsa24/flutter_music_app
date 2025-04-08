import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_flutter_app/controllers/permission_controller.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final req = Get.find<PermissionController>();

    return Scaffold(
      appBar: AppBar(title: Text("Music")),
      body: Center(
        child: Obx(
          () => Text(
            "permission: ${req.isGranted.value ? "diizinkan" : "tidak diizinkan"}",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: req.handlePermission,
        child: Icon(Icons.storage_outlined),
      ),
    );
  }
}

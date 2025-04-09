import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/controllers/player_controller.dart';
import "package:music_flutter_app/screens/playlist_screen.dart";
import "package:music_flutter_app/screens/music_screen.dart";
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:music_flutter_app/controllers/screens_controller.dart';
import 'package:music_flutter_app/screens/home_screen.dart';
import 'package:music_flutter_app/screens/settings_screen.dart';
import 'package:music_flutter_app/widgets/floating_music_card.dart';

class RootScreens extends StatelessWidget {
  RootScreens({super.key});
  final ScreensController _screensController = Get.put(ScreensController());
  final PageController _pageController = PageController();
  final playerController = Get.find<PlayerController>();
  final screens = [
    HomeScreen(),
    MusicScreen(),
    PlaylistScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (v) => _screensController.onNavItemTap(v),
            itemBuilder: (context, index) => screens[index],
            itemCount: screens.length,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Obx(() {
              final props = playerController.currentPlaying.value;
              if (props.uri.isEmpty) {
                return SizedBox.shrink();
              }
              return FloatingMusicCard(props: props);
            }),
          ),
        ],
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _screensController.currentScreen.value,
          onTap: (v) {
            _pageController.animateToPage(
              v,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeInOut,
            );
            _screensController.onNavItemTap(v);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home_2), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.musicnote),
              label: "Music",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.music_playlist),
              label: "Playlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.setting_2),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

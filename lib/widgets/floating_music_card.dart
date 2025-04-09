import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter/material.dart';
import 'package:music_flutter_app/constants/styles_constant.dart';
import 'package:music_flutter_app/constants/theme_constant.dart';
import 'package:music_flutter_app/controllers/player_controller.dart';
import 'package:music_flutter_app/models/music_card_model.dart';

class FloatingMusicCard extends StatelessWidget {
  FloatingMusicCard({super.key, required this.props});
  final MusicCardModel props;

  final playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        color: ThemeConstant.secondary(context),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    spacing: 8,
                    children: [
                      SizedBox(
                        width: 42,
                        height: 42,
                        child:
                            props.imgCover != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.memory(
                                    props.imgCover!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : Center(child: Icon(Icons.music_note)),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              props.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: StylesConstant(
                                context: context,
                              ).textStyle(size: 14),
                            ),
                            Text(
                              props.artist,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: StylesConstant(context: context).textStyle(
                                size: 12,
                                color: ThemeConstant.hintText(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  spacing: 18,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Iconsax.previous),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (playerController.isPlay.value) {
                          playerController.player.pause();
                          playerController.isPlay.value = false;
                        } else {
                          playerController.resumeAudio();
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        child: Obx(
                          () => Icon(
                            playerController.isPlay.value
                                ? Iconsax.pause
                                : Iconsax.play,
                            key: ValueKey(playerController.isPlay.value),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: Icon(Iconsax.next)),
                  ],
                ),
              ],
            ),
            Obx(() {
              double progress = playerController.position.value;
              if (progress.isNaN || progress < 0.0) progress = 0.0;
              if (progress > 1.0) progress = 1.0;

              return Container(
                height: 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeConstant.hintText(context),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ThemeConstant.ternary(context),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_flutter_app/constants/styles_constant.dart';
import 'package:music_flutter_app/controllers/player_controller.dart';
import 'package:music_flutter_app/models/music_card_model.dart';
import 'package:music_flutter_app/widgets/player_controller_widget.dart';
import 'package:get/get.dart';

class MusicView extends StatelessWidget {
  MusicView({super.key, required this.props});
  final MusicCardModel props;
  final playerController = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child:
                props.imgCover != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.memory(props.imgCover!, fit: BoxFit.cover),
                    )
                    : Center(child: Icon(Icons.music_note)),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  props.title,
                  style: StylesConstant(context: context).textStyle(size: 14),
                ),
                Text(props.artist),
              ],
            ),
          ),
          playerControllerWidget(isPlay: false),
        ],
      ),
    );
  }
}

import 'package:music_flutter_app/constants/styles_constant.dart';
import 'package:music_flutter_app/constants/theme_constant.dart';
import 'package:music_flutter_app/models/music_card_model.dart';
import 'package:flutter/material.dart';

Widget musicCard({
  required MusicCardModel props,
  required BuildContext context,
}) => GestureDetector(
  onTap: () {},
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child:
                  props.imgCover != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.memory(props.imgCover!, fit: BoxFit.cover),
                      )
                      : Center(child: Icon(Icons.music_note)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    props.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StylesConstant(context: context).textStyle(size: 14, weight: FontWeight.w700),
                  ),
                  Text(
                    props.artist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: StylesConstant(
                      context: context,
                    ).textStyle(color: ThemeConstant.hintText(context)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
    ],
  ),
);

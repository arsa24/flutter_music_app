import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter/material.dart';

Widget playerControllerWidget({required bool isPlay}) => Row(
  spacing: 20,
  children: [
    IconButton(onPressed: () {}, icon: Icon(Iconsax.previous)),
    IconButton(
      onPressed: () {},
      icon: Icon(isPlay ? Iconsax.pause : Iconsax.play),
    ),
    IconButton(onPressed: () {}, icon: Icon(Iconsax.next)),
  ],
);

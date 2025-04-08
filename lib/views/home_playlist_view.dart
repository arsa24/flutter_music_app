import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget homePlaylistView({double? x, double? y}) => SizedBox(
  height: 140,
  child: ListView.separated(
    padding: EdgeInsets.symmetric(horizontal: x ?? 16, vertical: y ?? 0),
    separatorBuilder: (context, index) => Gap(12),
    scrollDirection: Axis.horizontal,
    itemCount: 12,
    itemBuilder:
        (context, index) => Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
  ),
);

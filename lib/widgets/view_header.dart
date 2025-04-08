import 'package:flutter/widgets.dart';
import 'package:music_flutter_app/constants/styles_constant.dart';

Widget viewHeader({
  required String title,
  double x = 16,
  double y = 0,
  required BuildContext context,
}) => Padding(
  padding: EdgeInsets.symmetric(horizontal: x, vertical: y),
  child: Text(
    title,
    style: StylesConstant(context: context).textStyle(size: 16),
  ),
);

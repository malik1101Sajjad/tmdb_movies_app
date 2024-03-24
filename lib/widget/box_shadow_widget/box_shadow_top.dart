import 'package:flutter/material.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';

class ShadowTop extends BoxShadow {
  ShadowTop()
      : super(
            color: shadowtopColor,
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(-2, -2));
}

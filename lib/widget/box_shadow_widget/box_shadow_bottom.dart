import 'package:flutter/material.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';

class ShadowBottom extends BoxShadow {
  ShadowBottom()
      : super(
            color: shadowBotomColor,
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(3, 3));
}

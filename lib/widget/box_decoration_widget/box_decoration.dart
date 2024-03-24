import 'package:flutter/material.dart';
import 'package:netflex_app/widget/color_widget/colors.dart';

import '../box_shadow_widget/box_shadow_bottom.dart';
import '../box_shadow_widget/box_shadow_top.dart';

class BoxDecorationWidget extends BoxDecoration {
  BoxDecorationWidget()
      : super(
            color: backgrondColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [ShadowBottom(), ShadowTop()]);
}

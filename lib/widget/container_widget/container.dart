import 'package:flutter/material.dart';
import 'package:netflex_app/widget/box_decoration_widget/box_decoration.dart';

class ContainerWidget extends Container {
 final double height;
  ContainerWidget({required this.child,required this.height, required super.key})
      : super(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: height,
            decoration: BoxDecorationWidget(),
            child: child);
  final Widget child;
}

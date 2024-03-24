import 'package:flutter/material.dart';

double calculateContainerHeight(BuildContext context,double value)  {
    // Calculate the dynamic height based on the content and screen orientation
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      // Use landscape-specific height calculation
      return MediaQuery.of(context).size.width*value;
    } else {
      // Use portrait-specific height calculation
      return MediaQuery.of(context).size.height*value;
    }
  }
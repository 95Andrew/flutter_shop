import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/util/app_colors.dart';

import 'package:get/get.dart';

class GradientBackground extends GetView {
  final Widget child;

  const GradientBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [gradientColorStart, gradientColorEnd],
          ),
        ),
        child: child);
  }
}

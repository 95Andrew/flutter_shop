import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/util/app_colors.dart';
import 'package:flutter_shop/ui/util/ui_helpers.dart';
import 'package:get/get.dart';

class CustomButton extends GetView {
  final String text;
  final Function onTap;

  CustomButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpaceBig * 2),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadiusButton),
        color: backgroundColorButton,
        child: Ink(
          height: Get.size.height / 20,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(borderRadiusButton),
            child: Center(child: Text(text.toUpperCase())),
          ),
        ),
      ),
    );
  }
}

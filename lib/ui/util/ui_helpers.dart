import 'package:flutter/material.dart';

const double verticalSpaceSmall = 10.0;
const double verticalSpaceMedium = 20.0;
const double verticalSpaceBig = 40.0;
const double horizontalSpaceSmall = 10.0;
const double horizontalSpaceMedium = 20.0;
const double horizontalSpaceBig = 40.0;
const double spaceDefault = 35.0;
const double spaceDefaultBig = 50.0;
const double borderRadiusButton = 8.0;

Widget verticalSpacer(double size) {
  return SizedBox(height: size);
}

Widget horizontalSpacer(double size) {
  return SizedBox(width: size);
}
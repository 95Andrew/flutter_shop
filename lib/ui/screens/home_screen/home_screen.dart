import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/screens/catalog_screen/catalog_screen.dart';
import 'package:flutter_shop/ui/screens/login_screen/login_screen.dart';
import 'package:flutter_shop/ui/screens/register_screen/register_screen.dart';

import 'package:flutter_shop/ui/shared/const_strings.dart';
import 'package:flutter_shop/ui/shared/gradient_background.dart';
import 'package:flutter_shop/ui/util/app_binding.dart';
import 'package:flutter_shop/ui/util/ui_helpers.dart';
import 'package:flutter_shop/ui/widgets/custom_button.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(
              text: login,
              onTap: () {
                Get.to(() =>LoginScreen(), binding: LoginBinding());
              },
            ),
            verticalSpacer(verticalSpaceMedium),
            CustomButton(
              text: registration,
              onTap: () {
                Get.to(() =>RegisterScreen(), binding: RegisterBinding());
              },
            ),
            verticalSpacer(verticalSpaceMedium),
            CustomButton(
                text: withoutRegistering,
                onTap: () {
                  Get.to(() =>CatalogScreen(), binding: CatalogBinding());
                }),
          ],
        ),
      ),
    );
  }
}

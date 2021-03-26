import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/screens/login_screen/login_controller.dart';
import 'package:flutter_shop/ui/shared/const_strings.dart';
import 'package:flutter_shop/ui/shared/gradient_background.dart';
import 'package:flutter_shop/ui/util/ui_helpers.dart';
import 'package:flutter_shop/ui/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : loginForm(),
      ),
    );
  }

  Form loginForm() {
    return Form(
              key: _formKey,
              child: GradientBackground(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalSpaceBig),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: login),
                        controller: controller.loginController,
                        validator: (value) => value.isEmpty ? enterLogin : null,
                      ),
                      verticalSpacer(verticalSpaceMedium),
                      TextFormField(
                        decoration: InputDecoration(labelText: password),
                        controller: controller.passwordController,
                        validator: (value) => value.isEmpty ? enterPassword : null,
                      ),
                      verticalSpacer(verticalSpaceBig),
                      CustomButton(
                        text: login,
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            controller.login();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}

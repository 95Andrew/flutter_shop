import 'package:flutter/material.dart';
import 'package:flutter_shop/data/repository/register_repository.dart';
import 'package:flutter_shop/ui/screens/login_screen/login_screen.dart';
import 'package:flutter_shop/ui/util/app_binding.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterRepository registerRepository;
  RxBool isLoading = false.obs;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterController({this.registerRepository});

  Future<void> register() async {
    isLoading.value = true;
    final result = await registerRepository.register(username: loginController.text, password: passwordController.text);
    result.fold((error) => Get.snackbar(error.message, '', snackPosition: SnackPosition.BOTTOM), (resp) async {
      if (resp) {
        isLoading.value = false;
        loginController.clear();
        passwordController.clear();
        Get.offAll(() => LoginScreen(), binding: LoginBinding());
      }
    });
    isLoading.value = false;
  }
}

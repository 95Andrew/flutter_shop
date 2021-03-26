import 'package:flutter/material.dart';
import 'package:flutter_shop/data/repository/login_repository.dart';
import 'package:flutter_shop/ui/screens/catalog_screen/catalog_screen.dart';
import 'package:flutter_shop/ui/util/app_binding.dart';
import 'package:flutter_shop/ui/util/secure_storage_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository;
  SecureStorageService secureStorageService;
  RxBool isLoading = false.obs;
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController({this.loginRepository, this.secureStorageService});

  Future<void> login() async {
    isLoading.value = true;
    final result = await loginRepository.login(username: loginController.text, password: passwordController.text);
    result.fold((error) => Get.snackbar(error.message, error.message, snackPosition: SnackPosition.BOTTOM), (response) async {
      await secureStorageService.writeToken(response.token);
      loginController.clear();
      passwordController.clear();
      Get.offAll(CatalogScreen(), binding: CatalogBinding());
    });
    isLoading.value = false;
  }
}

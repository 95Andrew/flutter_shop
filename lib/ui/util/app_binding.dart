import 'package:flutter_shop/ui/screens/catalog_screen/catalog_controller.dart';
import 'package:flutter_shop/ui/screens/detail_catalog_screen/detail_catalog_controller.dart';
import 'package:flutter_shop/ui/screens/login_screen/login_controller.dart';
import 'package:flutter_shop/ui/screens/register_screen/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController(registerRepository: Get.find()));
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(loginRepository: Get.find(), secureStorageService: Get.find()));
  }
}

class CatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogController>(() => CatalogController(productRepository: Get.find()));
  }
}

class DetailCatalogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCatalogController>(() => DetailCatalogController(
        reviewProducRepository: Get.find(), postReviewProductRepository: Get.find(), secureStorageService: Get.find()));
  }
}

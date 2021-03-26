import 'package:flutter_shop/data/dto/product.dart';
import 'package:flutter_shop/data/repository/product_repository.dart';
import 'package:get/get.dart';

class CatalogController extends GetxController {
  ProductRepository productRepository;
  RxBool isLoading = false.obs;
  List<Product> listProduct = [];

  CatalogController({this.productRepository});

  @override
  onInit() {
    super.onInit();
     getProductsList();
  }

  Future<void> getProductsList() async {
    isLoading.value = true;
    final result = await productRepository.getProductsList();
    result.fold((error) => Get.snackbar(error.message, '', snackPosition: SnackPosition.BOTTOM), (response) async {
      listProduct = response.map((product) => product).toList();
      update();
    });
    isLoading.value = false;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/data/dto/review_product.dart';
import 'package:flutter_shop/data/repository/post_review_product_repository.dart';
import 'package:flutter_shop/data/repository/review_product_repository.dart';
import 'package:flutter_shop/ui/screens/catalog_screen/catalog_screen.dart';
import 'package:flutter_shop/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_shop/ui/util/app_binding.dart';
import 'package:flutter_shop/ui/util/app_colors.dart';
import 'package:flutter_shop/ui/util/secure_storage_service.dart';
import 'package:get/get.dart';

class DetailCatalogController extends GetxController {
  ReviewProducRepository reviewProducRepository;

  PostReviewProductRepository postReviewProductRepository;

  SecureStorageService secureStorageService;
  RxBool isLoading = false.obs;
  RxBool isShowAddComment = false.obs;
  RxDouble rating = 0.0.obs;

  List<ReviewProduct> listReviewProduct = [];
  final orderCommentController = TextEditingController();

  DetailCatalogController({this.reviewProducRepository, this.postReviewProductRepository, this.secureStorageService});

  Future<void> logout() async {
    await secureStorageService.clearStorage();
    await Get.offAll(HomeScreen());
  }

  Future<void> getReviewProductsList({int id}) async {
    isLoading.value = true;
    final result = await reviewProducRepository.getReviewProductsList(id: id);
    result.fold((error) => Get.snackbar(error.message, '', snackPosition: SnackPosition.BOTTOM), (response) async {
      listReviewProduct = response.map((product) => product).toList();
      update();
    });
    isLoading.value = false;
  }

  Future<void> postReviewProduct({int id}) async {
    isLoading.value = true;
    final result =
        await postReviewProductRepository.postReviewProduct(id: id, rate: rating.round(), text: orderCommentController.text);
    result.fold((error) => Get.snackbar(error.message, '', colorText: backgroundColorButton, snackPosition: SnackPosition.BOTTOM),
        (response) async {
      Get.offAll(CatalogScreen(), binding: CatalogBinding());
    });
    isLoading.value = false;
  }

  Future<void> verificationTokenComment() async {
    isShowAddComment.value = await secureStorageService.checkToken();
  }
}

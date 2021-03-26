import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_shop/ui/util/secure_storage_service.dart';
import 'package:get/get.dart';

import 'data/repository/login_repository.dart';
import 'data/repository/post_review_product_repository.dart';
import 'data/repository/product_repository.dart';
import 'data/repository/register_repository.dart';
import 'data/repository/review_product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  Get.put(RegisterRepository() );
  Get.put(LoginRepository());
  Get.put(ProductRepository());
  Get.put(SecureStorageService());
  Get.put(ReviewProducRepository());
  Get.put(PostReviewProductRepository());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // initialBinding: ,
    );
  }
}

import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/api/product_api.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:flutter_shop/data/dto/product.dart';
import 'package:get/get.dart';

class ProductRepository extends GetConnect{
  final ProductApi _productApi = ProductApi();
  Future<Either<ErrorResponse, List<Product>>> getProductsList() async {
    return await _productApi.getProductsList();
  }
}

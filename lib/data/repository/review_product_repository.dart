import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/api/review_product_api.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:flutter_shop/data/dto/review_product.dart';
import 'package:get/get.dart';

class ReviewProducRepository extends GetConnect{
  final ReviewProductApi _reviewProductApi = ReviewProductApi();

  Future<Either<ErrorResponse, List<ReviewProduct>>> getReviewProductsList({int id}) async {
    return await _reviewProductApi.getReviewProductsList(id: id);
  }
}

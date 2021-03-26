import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/api/post_review_product_api.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:get/get.dart';

class PostReviewProductRepository extends GetConnect {
  PostReviewProductApi reviewProductApi = PostReviewProductApi();

  Future<Either<ErrorResponse, bool>> postReviewProduct({int id, int rate, String text}) async {
    final response = await reviewProductApi.postReviewProduct(id: id, rate: rate, text: text);

    return response;
  }
}

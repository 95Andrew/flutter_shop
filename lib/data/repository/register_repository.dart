import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/api/register_api.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:get/get.dart';

class RegisterRepository extends GetConnect {
  final RegisterApi _api = RegisterApi();

  Future<Either<ErrorResponse, bool>> register({String username, String password}) async {
    return await _api.register(username: username, password: password);  
  }
}

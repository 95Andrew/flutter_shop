import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/api/login_api.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:flutter_shop/data/dto/register_and_login.dart';

import 'package:get/get.dart';

class LoginRepository extends GetConnect {

  LoginApi _api = LoginApi();

  Future<Either<ErrorResponse, LoginResponse>> login({String username, String password}) async {
    final result = await _api.login(username: username, password: password);
    return result;
  }
}

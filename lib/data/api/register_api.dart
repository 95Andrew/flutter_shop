import 'dart:convert';
import 'dart:io';

import 'package:either_option/either_option.dart';
import 'package:flutter_shop/data/dto/error_response.dart';
import 'package:flutter_shop/data/dto/register_and_login.dart';
import 'package:flutter_shop/ui/shared/constants.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<Either<ErrorResponse, bool>> register({String username, String password}) async {
    final url = Uri.parse('$urlApi/api/register/');
    final body = RegisterAndLogin(username: username, password: password).toJson();
    final result =
        await http.post(url, body: jsonEncode(body), headers: {HttpHeaders.contentTypeHeader: ContentType.json.mimeType});
    if (result.statusCode == HttpStatus.ok) {
      return Right(true);
    } else {
      return Left(ErrorResponse.fromJson(jsonDecode(result.body)));
    }
  }
}

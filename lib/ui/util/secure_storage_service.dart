import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_shop/ui/screens/catalog_screen/catalog_screen.dart';
import 'package:flutter_shop/ui/util/secure_storage_keys.dart';
import 'package:get/get.dart';

import 'app_binding.dart';

class SecureStorageService extends GetxService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  @override
  onInit() async {
    super.onInit();
    await verificationToken();
  }

  Future<void> writeToken(String token) async {
    await secureStorage.write(key: SecuredStorage.token, value: token);
  }

  Future<void> clearStorage() async {
    await secureStorage.delete(key: SecuredStorage.token);
  }

  Future verificationToken() async {
    final token = await secureStorage.read(key: SecuredStorage.token);
    if (token != null) {
      log(token);
      return Get.to(CatalogScreen(), binding: CatalogBinding());
    }
  }

  Future checkToken() async {
    final token = await secureStorage.read(key: SecuredStorage.token);
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}

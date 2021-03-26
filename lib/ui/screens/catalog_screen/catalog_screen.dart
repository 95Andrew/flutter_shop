import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/screens/detail_catalog_screen/detail_catalog_screen.dart';
import 'package:flutter_shop/ui/shared/gradient_background.dart';
import 'package:flutter_shop/ui/util/app_binding.dart';
import 'package:get/get.dart';

import 'catalog_controller.dart';

class CatalogScreen extends GetView<CatalogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : GradientBackground(
              child: ListView.builder(
                itemCount: controller.listProduct.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () =>
                          Get.to(() =>DetailCatalogScreen(id: controller.listProduct[index].id), binding: DetailCatalogBinding()),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     // image: NetworkImage('${controller.listProduct[index].img}'),
                        //     image: NetworkImage("${controller.listProduct[index].img}"),
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${controller.listProduct[index].id.toString()}'),
                            Text('${controller.listProduct[index].title}'),
                            Text('${controller.listProduct[index].text}'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )),
    );
  }
}

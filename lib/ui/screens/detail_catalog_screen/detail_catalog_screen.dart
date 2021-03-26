import 'package:flutter/material.dart';
import 'package:flutter_shop/ui/shared/const_strings.dart';
import 'package:flutter_shop/ui/shared/gradient_background.dart';
import 'package:flutter_shop/ui/util/ui_helpers.dart';
import 'package:flutter_shop/ui/widgets/custom_button.dart';
import 'package:flutter_shop/ui/widgets/custom_rating_bar.dart';
import 'package:flutter_shop/ui/widgets/default_appbar.dart';
import 'package:get/get.dart';

import 'detail_catalog_controller.dart';

class DetailCatalogScreen extends GetView<DetailCatalogController> {
  final int id;
  final _formKey = GlobalKey<FormState>();

  DetailCatalogScreen({Key key, this.id});
  @override
  Widget build(BuildContext context) {
    controller.getReviewProductsList(id: id);
    controller.verificationTokenComment();
    return Scaffold(
      appBar: DefaultAppBar(
        onPressed: () => controller.logout(),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : GradientBackground(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.listReviewProduct.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(controller.listReviewProduct[index].createdBy.username),
                                  Text(controller.listReviewProduct[index].text),
                                  CustomRatingBar(
                                    rating: controller.listReviewProduct[index].rate.toDouble(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Obx(() => controller.isShowAddComment.value
                              ? Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        CustomRatingBar(
                                          isIgnorePointer: false,
                                          rating: controller.rating.value,
                                          onRatingUpdate: (val) {
                                            controller.rating.value = val;
                                          },
                                        ),
                                        Container(
                                          child: TextFormField(
                                            decoration: InputDecoration(labelText: orderComment),
                                            controller: controller.orderCommentController,
                                            validator: (value) => value.isEmpty ? orderComment : null,
                                          ),
                                        ),
                                        verticalSpacer(verticalSpaceMedium),
                                        CustomButton(
                                            text: submitComment,
                                            onTap: () {
                                              if (_formKey.currentState.validate()) {
                                                controller.postReviewProduct(id: id);
                                              }
                                            })
                                      ],
                                    ),
                                  ),
                                )
                              : Container()
                          //   ),
                          ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

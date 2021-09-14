import 'package:flutter/material.dart';
// import 'package:untitled/constants/controllers.dart';
// import 'package:untitled/models/product.dart';
// import 'package:untitled/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';
import 'package:nix_shopping_app/controllers/controllers.dart';
import 'package:nix_shopping_app/models/product_model.dart';
import 'package:nix_shopping_app/widget/single_product.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .63,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: productController.products.map((ProductModel product) {
          return SingleProductWidget(
            product: product,
          );
        }).toList()));
  }
}

import 'package:flutter/material.dart';
import 'package:nix_shopping_app/controllers/controllers.dart';
import 'package:nix_shopping_app/models/product_model.dart';
import 'package:nix_shopping_app/widget/custom_text.dart';
// import 'package:untitled/constants/controllers.dart';
// import 'package:untitled/models/product.dart';
// import 'package:untitled/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.image!,
                  // width: double.infinity,
                  width: 155.0,
                  height: 145.0,
                )),
          ),
          CustomText(
            text: product.name,
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: product.brand,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  text: "\$${product.price}",
                  size: 20,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.green[800],
                  onPressed: () {
                    cartController.addProductToCart(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}

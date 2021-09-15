import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nix_shopping_app/controllers/controllers.dart';
import 'package:nix_shopping_app/widget/cart_item_widget.dart';
import 'package:nix_shopping_app/widget/custom_btn.dart';
import 'package:nix_shopping_app/widget/custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Shopping Cart",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userModel.value.cart!
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: Obx(
                () => CustomButton(
                    text:
                        "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                    onTap: () {
                      // paymentsController.createPaymentMethod();
                    }),
              ),
            ))
      ],
    );
  }
}

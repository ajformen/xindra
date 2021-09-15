import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nix_shopping_app/controllers/controllers.dart';
import 'package:nix_shopping_app/controllers/welcome_controller.dart';
import 'package:nix_shopping_app/models/product_model.dart';
import 'package:nix_shopping_app/widget/shopping_cart.dart';
// import 'package:nix_shopping_app/widget/products.dart';
import 'package:nix_shopping_app/widget/single_product.dart';
import 'package:nix_shopping_app/routes/app_pages.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.greenAccent),
        backgroundColor: Colors.grey[800],
        title: Text(
          'Xindra',
          style: TextStyle(
            color: Colors.greenAccent,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    child: ShoppingCartWidget(),
                  ),
                );
              })
        ],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[850],
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage(controller.user.photoURL!),
                radius: 30.0,
              ),
              accountName: Text(
                '${controller.user.displayName}',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                '${controller.user.email}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              leading: FaIcon(FontAwesomeIcons.user),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () {
                // Get.toNamed(Routes.PROFILE);
              },
              leading: FaIcon(FontAwesomeIcons.shoppingBag),
              title: Text('Shop'),
            ),
            ListTile(
              onTap: () {
                controller.logout();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: Obx(
        () => GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .63,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 10,
            children: productController.products.map((ProductModel product) {
              return SingleProductWidget(
                product: product,
              );
            }).toList()),
      ),
    );
  }
}

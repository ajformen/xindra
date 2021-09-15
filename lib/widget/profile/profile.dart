import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nix_shopping_app/constants/firebase.dart';
// import 'package:nix_shopping_app/controllers/controllers.dart';
import 'package:nix_shopping_app/controllers/welcome_controller.dart';
import 'package:nix_shopping_app/models/user_model.dart';
import 'package:nix_shopping_app/routes/app_pages.dart';
// import 'package:nix_shopping_app/models/product_model.dart';
// import 'package:nix_shopping_app/widget/products.dart';
// import 'package:nix_shopping_app/widget/single_product.dart';

class ProfileView extends GetView<WelcomeController> {
  final user = auth.currentUser;
  final usersRef = firebaseFirestore.collection('users');
  late UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.greenAccent),
        backgroundColor: Colors.grey[800],
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.greenAccent,
          ),
        ),
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
                // controller.logout();
              },
              leading: FaIcon(FontAwesomeIcons.user),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(Routes.WELCOME);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              // controller.login();
              currentUser = UserModel(id: auth.currentUser!.uid);
              DocumentSnapshot doc = await usersRef.doc(currentUser.id).get();

              usersRef.doc(currentUser.id).set({
                'id': currentUser.id,
                'name': controller.user.displayName,
                'email': controller.user.email,
                'isVerified': true,
                'cart': [],
              });
              doc = await usersRef.doc(currentUser.id).get();
              currentUser = UserModel.fromSnapshot(doc);
            },
            icon: FaIcon(FontAwesomeIcons.userCheck, color: Colors.red),
            label: Text('Verify this user!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:nix_shopping_app/widget/sign_up_widget.dart';
import 'package:nix_shopping_app/bindings/home_binding.dart';
import 'package:nix_shopping_app/controllers/product_controller.dart';
import 'package:nix_shopping_app/routes/app_pages.dart';

import 'constants/firebase.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   HomeBinding().dependencies();
//   runApp(GetMaterialApp(
//     // home: MyApp(),
//     title: 'Xindra',
//     initialRoute: AppPages.INITIAL,
//     getPages: AppPages.routes,
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//   ));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(ProductController());
  });
  HomeBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xindra',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SignUpWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

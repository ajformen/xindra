// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nix_shopping_app/constants/app_constants.dart';
import 'package:nix_shopping_app/constants/firebase.dart';
import 'package:nix_shopping_app/models/user_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();

  late Rx<User> firebaseUser;
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser!);
    ever(firebaseUser, _setInitialScreen());
  }

  _setInitialScreen() {
    userModel.bindStream(listenToUser());
  }

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}

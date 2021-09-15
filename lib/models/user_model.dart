import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nix_shopping_app/models/cart_item.dart';

class UserModel {
  static const ID = 'id';
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const VERIFIED = 'verified';
  static const CART = 'cart';

  String? id;
  String? name;
  String? email;
  bool? isVerified = false;
  List<CartItemModel>? cart;

  UserModel({this.id, this.name, this.email, this.cart, this.isVerified});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final d = snapshot.data() as Map;
    name = d[NAME];
    email = d[EMAIL];
    id = d[ID];
    isVerified = d[VERIFIED];
    cart = _convertCartItems(d[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFromDb) {
    List<CartItemModel> _result = [];
    if (cartFromDb.length > 0) {
      cartFromDb.forEach((element) {
        _result.add(CartItemModel.fromMap(element));
      });
    }
    return _result;
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
}

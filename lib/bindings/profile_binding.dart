import 'package:get/get.dart';
import 'package:nix_shopping_app/controllers/welcome_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }
}

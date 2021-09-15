import 'package:get/get.dart';
import 'package:nix_shopping_app/bindings/home_binding.dart';
import 'package:nix_shopping_app/bindings/login_binding.dart';
import 'package:nix_shopping_app/bindings/profile_binding.dart';
import 'package:nix_shopping_app/bindings/welcome_binding.dart';
import 'package:nix_shopping_app/widget/home_view.dart';
import 'package:nix_shopping_app/widget/profile/profile.dart';
import 'package:nix_shopping_app/widget/sign_up_widget.dart';
import 'package:nix_shopping_app/widget/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => SignUpWidget(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}

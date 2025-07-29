import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/create_profile_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/login_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/read_profile_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/signup_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/brand_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/create_cart_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/create_wishlist_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_review_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/read_cart_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/read_wish_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/slider_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(SliderController());
    Get.put(CategoryListController());
    Get.put(BrandListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
    Get.put(LoginController());
    Get.put(SignupController());
    Get.put(OtpVerificationController());
    Get.put(AuthenticationController());
    Get.put(ReadProfileController());
    Get.put(CreateProfileController());
    Get.put(ProductReviewController());
    Get.put(CreateCartListController());
    Get.put(ReadCartListController());
    Get.put(ReadWishListController());
    Get.put(CreateWishListController());
  }
}

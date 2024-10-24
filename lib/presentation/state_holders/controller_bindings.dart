import 'package:e_commerce_app/presentation/state_holders/auth_controller/email_verification_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/brand_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_controller.dart';
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
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());

  }
}
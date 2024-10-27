import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/create_cart_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    required this.buttonName,
    required this.price,
    required this.priceTag,
    this.productId = 1,
    this.color = "Red",
    this.size = "X",
    this.qty = 1,
    super.key,
  });

  final String buttonName;
  final String price;
  final String priceTag;
  final int productId;
  final String color;
  final String size;
  final int qty;

  Future<void> _onTapAddToCart() async {
    bool result = Get.find<AuthenticationController>().isLoggedIn();
    if (result) {
      Map<String, dynamic> cartInfo = {
        "product_id": productId.toString(),
        "color": color,
        "size": size,
        "qty": qty.toString()
      };

      String token = Get.find<AuthenticationController>().accessToken!;
      bool productAdded = await Get.find<CreateCartListController>()
          .createCartListRequest(cartInfo, token);

      if(productAdded) {
        Get.snackbar("Congrats", "Product Added Successful");
      } else {
        Get.snackbar("Opps!", "Product Add Failed");
      }
    } else {
      Get.toNamed("/emailValidationScreen");
      Get.snackbar(
          "Login Required", "To Add Product into Cart You need to Login first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: AppColorTheme.appColorTheme.withOpacity(.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  priceTag,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text("\$${price}",
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            const Spacer(),
            GetBuilder<CreateCartListController>(
              builder: (controller) {
                return Visibility(
                  visible: !controller.createCartListInProgress,
                  replacement: const Center(child: CircularProgressIndicator(),),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(120),
                    ),
                    onPressed: _onTapAddToCart,
                    child: Text(
                      buttonName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({
    required this.buttonName,
    required this.price,
    required this.priceTag,
    super.key,
  });

  final String buttonName;
  final String price;
  final String priceTag;

  Future<void> _onTapAddToCart () async {
    bool result = await Get.find<AuthenticationController>().isLoggedIn();
    if(result) {

    }
    else {
      Get.toNamed("/emailValidationScreen");
      Get.snackbar("Login Required", "To Add Product into Cart You need to Login first");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: AppColorTheme.appColorTheme.withOpacity(.3),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(priceTag,style: Theme.of(context).textTheme.titleSmall,),
                Text("\$${price}",style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const  Size.fromWidth(120),
              ),
              onPressed: _onTapAddToCart, child: Text(buttonName, style: const TextStyle(color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}
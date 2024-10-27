import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/read_wish_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/widgets/bottom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    if(Get.find<AuthenticationController>().isLoggedIn()) {
      Get.find<ReadWishListController>().readWishListRequest();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GetBuilder<ReadWishListController>(builder: (controller) {
          return controller.wishListSize != 0
              ? ListView.separated(
            itemCount: controller.wishListSize,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) =>  Card(
              elevation: 3,
              child: SizedBox(
                height: 120,
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(controller
                                  .wishList[index].product!.image!),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.wishList[index].product!.title!
                                  .substring(0, 10) +
                                  '...',
                              style:
                              Theme.of(context).textTheme.titleSmall,
                            ),
                            // Text(
                            //   "Color:${controller.wishList[index].color} , Size: ${controller.cartList[index].size}",
                            //   style:
                            //   Theme.of(context).textTheme.bodyMedium,
                            // ),
                            //Text('qty: ${controller.cartList[index].qty}', style: const TextStyle(color: Colors.red),),
                            //const Spacer(),
                            Text(
                              "\$${controller.wishList[index].product!.price!}",
                              style:const  TextStyle(
                                fontSize: 18,
                                color: AppColorTheme.appColorTheme,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.delete)),
                          // Row(
                          //   children: [
                          //     InkWell(
                          //       onTap: () {},
                          //       child: CircleAvatar(
                          //         backgroundColor: AppColorTheme
                          //             .appColorTheme
                          //             .withOpacity(.4),
                          //         maxRadius: 12,
                          //         child: const Icon(Icons.remove),
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 8,
                          //     ),
                          //     Text("2"),
                          //     const SizedBox(
                          //       width: 8,
                          //     ),
                          //     InkWell(
                          //       onTap: () {},
                          //       child: const CircleAvatar(
                          //         backgroundColor:
                          //             AppColorTheme.appColorTheme,
                          //         maxRadius: 12,
                          //         child: Icon(
                          //           Icons.add,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
              : const Center(child: Text("Your Wish List Is Empty"));
        }),
      ),
      // bottomNavigationBar: BottomAppBarWidget(
      //   buttonName: "Checkout",
      //   priceTag: "Total Price",
      //   price: "${priceController.totalPrice()}",
      //   // qty: 0,
      //   // productId: 1,
      //   // size: 'XL',
      //   // color: 'Yellow',
      // ),
    );
  }
}

import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/widgets/bottom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductListDataModel product;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.brown,
      Colors.blue
    ];
    const List<String> sizes = ["S", "M", "L", "XL", "XXL"];

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.brown,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .25,
                width: double.maxFinite,
                child: Image.network(
                  product.image!,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width * .65,
                          child: Wrap(
                            children: [
                              Text(
                                product.title!,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<ProductDetailsController>(
                            builder: (controller) {
                          return SizedBox(
                            width: Get.width * .30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.decrement();
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: AppColorTheme.appColorTheme,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  controller.itemCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.increment();
                                  },
                                  icon: const Icon(
                                    Icons.add_circle_rounded,
                                    color: AppColorTheme.appColorTheme,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(product.star!.toString()),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Reviews",
                                style: TextStyle(
                                    color: AppColorTheme.appColorTheme),
                              ),
                            ),
                            const Icon(CupertinoIcons.heart),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Color",
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 10,
                          children: colors
                              .map((item) => CircleAvatar(
                                    backgroundColor: item,
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Size",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 10,
                          children: sizes
                              .map((item) => CircleAvatar(
                                    backgroundColor: Colors.grey.shade400,
                                    child: Text(item),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(product.shortDes!),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GetBuilder<ProductDetailsController>(
          builder: (controller) {
            return BottomAppBarWidget(
                buttonName: "Add to Cart",
                price: "${int.tryParse(product.price!)! * controller.itemCount}  ",
                priceTag: "Price");
          }
        ));
  }
}
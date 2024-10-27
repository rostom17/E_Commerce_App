import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/create_wishlist_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_details_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/widgets/bottom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductListDataModel product;

  void _onTapReview() {
    Get.toNamed('/reviewScreen', arguments: product.id.toString());
  }

  Future<void> _onPressedFavouriteButton() async {
    if(Get.find<AuthenticationController>().isLoggedIn()) {
      Get.find<CreateWishListController>().toggle();
      bool result = await Get.find<CreateWishListController>()
          .createWishListRequest("${product.id}");
      if (result) {
        Get.snackbar("Successful", "I have added this item to your Wish List");
      } else {
        Get.snackbar("failed", "Try again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _pageViewController = PageController();

    final List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.yellow,
      Colors.brown,
      Colors.blue
    ];
    const List<String> sizes = ["S", "M", "L", "XL", "XXL"];

    List<String> imageLinks = [
      product.image!,
      product.brand!.brandImg!,
      product.category!.categoryImg!
    ];

    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productImage(_pageViewController, imageLinks),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _productTitileAndQuantityRow(context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _reviewSection(),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Color",
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(
                        height: 10,
                      ),
                      _colorSelector(colors),
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
                      _sizeSelection(sizes),
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
      bottomNavigationBar:
          GetBuilder<ProductDetailsController>(builder: (controller) {
        return BottomAppBarWidget(
            color: "Red",
            size: "X",
            productId: product.id ?? 1,
            qty: controller.itemCount,
            buttonName: "Add to Cart",
            price: "${int.tryParse(product.price!)! * controller.itemCount}  ",
            priceTag: "Price");
      }),
    );
  }

  Wrap _sizeSelection(List<String> sizes) {
    return Wrap(
      spacing: 10,
      children: sizes
          .map(
            (item) => InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Text(item),
              ),
            ),
          )
          .toList(),
    );
  }

  Wrap _colorSelector(List<Color> colors) {
    return Wrap(
      spacing: 10,
      children: colors
          .map(
            (item) => InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: item,
              ),
            ),
          )
          .toList(),
    );
  }

  Row _reviewSection() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        Text(product.star!.toString()),
        TextButton(
          onPressed: _onTapReview,
          child: const Text(
            "Reviews",
            style: TextStyle(color: AppColorTheme.appColorTheme),
          ),
        ),
        GetBuilder<CreateWishListController>(
          builder: (controller) {
            return IconButton(
                onPressed: _onPressedFavouriteButton,
                icon: controller.isFav
                    ? const Icon(CupertinoIcons.heart_fill)
                    : const Icon(CupertinoIcons.heart));
          }
        ),
      ],
    );
  }

  Row _productTitileAndQuantityRow(BuildContext context) {
    return Row(
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
        GetBuilder<ProductDetailsController>(builder: (controller) {
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
    );
  }

  SizedBox productImage(
      PageController _pageViewController, List<String> imageLinks) {
    return SizedBox(
      height: 240,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageViewController,
            children: imageLinks.map((items) => _createPage(items)).toList(),
          ),
          Positioned(
            top: 215,
            child: _buildPageIndicator(_pageViewController, imageLinks.length),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
        ),
      ),
    );
  }

  Widget _buildPageIndicator(PageController controller, int size) {
    return SmoothPageIndicator(
      controller: controller,
      count: size,
      effect: const WormEffect(),
    );
  }
}

ClipRRect _createPage(String imageLink) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      child: Image.network(
        imageLink,
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}

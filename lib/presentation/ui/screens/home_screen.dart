import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/data/models/slider_data_model.dart';
import 'package:e_commerce_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/brand_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/slider_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_list_screen.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/widgets/category_card_widget.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:e_commerce_app/presentation/ui/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageViewController = PageController();
  final _sliderController = Get.find<SliderController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchBarWidget(),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<SliderController>(
              builder: (_) {
                return Visibility(
                  replacement: _buildSliderPageWithoutImage(),
                  visible:
                      _sliderController.sliderListRequestInProgress == false,
                  child: _buildSliderPage(_sliderController.sliderList),
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            _buildPageIndicator(),
            const SizedBox(
              height: 16,
            ),
            _buildSection(context, "All Categories"),
            const SizedBox(
              height: 16,
            ),
            _categoriesItemRowBuilder(),
            const SizedBox(
              height: 16,
            ),
            _buildSection(context, "Popular"),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<ProductListController>(builder: (controller) {
              return _productBuilder(controller.productListPopular);
            }),
            const SizedBox(
              height: 16,
            ),
            _buildSection(context, "New"),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<ProductListController>(builder: (controller) {
              return _productBuilder(controller.productListNew);
            }),
            const SizedBox(
              height: 16,
            ),
            _buildSection(context, "Regular"),
            const SizedBox(
              height: 16,
            ),
            GetBuilder<ProductListController>(
              builder: (controller) {
                return _productBuilder(controller.productListRegular);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            _buildSection(context, "Brands"),
            const SizedBox(
              height: 16,
            ),
            _brandListBuilder(),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSliderPage(List<SliderDataModel> sliderList) {
    return SizedBox(
      height: Get.height * .175,
      child: PageView(
        controller: _pageViewController,
        children: sliderList
            .map(
              (items) => _createPage(items.image!),
            )
            .toList(),
      ),
    );
  }

  SizedBox _buildSliderPageWithoutImage() {
    return SizedBox(
      height: Get.height * .175,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return GetBuilder<SliderController>(
      builder: (_) {
        if (!_sliderController.sliderListRequestInProgress &&
            _sliderController.sliderListLength > 0) {
          return SmoothPageIndicator(
            controller: _pageViewController,
            count: _sliderController.sliderListLength,
            effect: const WormEffect(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Row _buildSection(BuildContext context, String name) {
    return Row(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            if (name == "All Categories") {
              Get.find<BottomNavController>().selectedIndex.value = 1;
            } else if (name == "Popular") {
              Get.to(ProductListScreen(
                  productList:
                      Get.find<ProductListController>().productListPopular));
            } else if (name == "New") {
              Get.to(ProductListScreen(
                  productList:
                      Get.find<ProductListController>().productListNew));
            } else if (name == "Regular") {
              Get.to(ProductListScreen(
                  productList:
                      Get.find<ProductListController>().productListRegular));
            }
          },
          child: Text(
            'See All',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }

  Widget _categoriesItemRowBuilder() {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: GetBuilder<CategoryListController>(builder: (controller) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) => CategoryCardWidget(
            name: controller.categoryList[idx].categoryName ?? "No Name",
            imageLink: controller.categoryList[idx].categoryImg ?? "No Image",
          ),
          separatorBuilder: (_, __) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.categoryList.length,
        );
      }),
    );
  }

  SizedBox _productBuilder(List<ProductListDataModel> productList) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductCardWidget(
          product: productList[index],
        ),
        separatorBuilder: (_, __) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }

  Widget _brandListBuilder() {
    return SizedBox(
      height: 120,
      width: double.maxFinite,
      child: GetBuilder<BrandListController>(builder: (controller) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, idx) => CategoryCardWidget(
            name: controller.brandList[idx].brandName ?? "No Name",
            imageLink: controller.brandList[idx].brandImg ?? "No Image",
          ),
          separatorBuilder: (_, __) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.brandList.length,
        );
      }),
    );
  }
}

ClipRRect _createPage(String imageLink) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(
      child: Image.network(
        imageLink,
        fit: BoxFit.cover,
        errorBuilder: (context, error, starckTrace) => Container(
          color: Colors.red,
          child: const Icon(Icons.broken_image),
        ),
      ),
    ),
  );
}

ClipRRect _createPageWithoutImage(Color color) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Container(color: color),
  );
}

import 'package:e_commerce_app/presentation/state_holders/brand_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_controller.dart';
import 'package:e_commerce_app/presentation/state_holders/slider_controller.dart';
import 'package:e_commerce_app/presentation/ui/widgets/appbar_widget_for_others.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:e_commerce_app/presentation/ui/screens/cart_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/category_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/wish_list_screen.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/home_screen.dart';
import 'package:e_commerce_app/presentation/ui/widgets/appbar_widget_for_home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final _bottomNavController = Get.find<BottomNavController>();

  final _bottomNavScreens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  List<String> appBarTitle = ["Home", "Category", "Cart", "Wish List"];

  void onTap () {
    _bottomNavController.selectedIndex.value = 0;
  }
  @override
  void initState() {
    Get.find<SliderController>().getSliderData();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<BrandListController>().getBrandListRequest();
    Get.find<ProductListController>().getProductList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(
          () => _bottomNavController.selectedIndex.value == 0
              ? const AppbarWidgetForHomeScreen()
              : AppBarWidgetForOthers(
                  name: appBarTitle[_bottomNavController.selectedIndex.value],
                  ontap: onTap,
                ),
        ),
      ),
      body: Obx(
          () => _bottomNavScreens[_bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 22, right: 22),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 5,
                    offset: const Offset(double.maxFinite, -10),
                  )
                ],
              ),
              child: NavigationBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.black,
                height: 70,
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                selectedIndex: _bottomNavController.selectedIndex.value,
                onDestinationSelected: (index) =>
                _bottomNavController.selectedIndex.value = index,
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Iconsax.home,
                      color: _bottomNavController.selectedIndex.value == 0
                          ? AppColorTheme.appColorTheme
                          : Colors.black,
                    ),
                    label: 'Home',
                  ),
                  NavigationDestination(
                      icon: Icon(
                        Iconsax.element_4,
                        color: _bottomNavController.selectedIndex.value == 1
                            ? AppColorTheme.appColorTheme
                            : Colors.black,
                      ),
                      label: 'Category'),
                  NavigationDestination(
                      icon: Icon(
                        Iconsax.shopping_cart,
                        color: _bottomNavController.selectedIndex.value == 2
                            ? AppColorTheme.appColorTheme
                            : Colors.black,
                      ),
                      label: 'Cart'),
                  NavigationDestination(
                      icon: Icon(
                        Iconsax.gift,
                        color: _bottomNavController.selectedIndex.value == 3
                            ? AppColorTheme.appColorTheme
                            : Colors.black,
                      ),
                      label: 'Wish List'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

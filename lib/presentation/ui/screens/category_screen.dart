import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce_app/presentation/state_holders/category_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/widgets/category_card_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryListController>(builder: (controller) {
        return GridView.builder(
          itemCount: controller.categoryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: .75),
          itemBuilder: (context, index) => CategoryCardWidget(
            name: controller.categoryList[index].categoryName ?? "No Name",
            imageLink: controller.categoryList[index].categoryImg ?? "Image",
          ),
        );
      }),
    );
  }
}

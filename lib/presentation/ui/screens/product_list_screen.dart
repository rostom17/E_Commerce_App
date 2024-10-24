import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/presentation/state_holders/product_list_controller.dart';
import 'package:e_commerce_app/presentation/ui/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.productList});

  final List<ProductListDataModel> productList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ProductListController>(
          builder: (controller) {
            return GridView.builder(
              itemCount: productList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .8,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (ctx, idx) => ProductCardWidget(
                  product: productList[idx],
                ));
          }
        ),
      ),
    );
  }
}

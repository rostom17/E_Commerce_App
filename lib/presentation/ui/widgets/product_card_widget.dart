import 'package:e_commerce_app/data/models/product_list_data_model.dart';
import 'package:e_commerce_app/presentation/ui/screens/product_details_screen.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
  });

  final ProductListDataModel product;

  @override
  Widget build(BuildContext context) {
    bool _favourite = false;

    return InkWell(
      onTap: () {
        Get.to(ProductDetailsScreen(
          product: product,
        ));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 105,
              width: 150,
              decoration: BoxDecoration(
                color: AppColorTheme.appColorTheme.withOpacity(.15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(product.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: product.title!.length >= 15 ? Text("${product.title!.substring(0, 15)}...")
                  : Text(product.title!),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Wrap(
                children: [
                  Text(
                    '\$${product.price!}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 16,
                  ),
                  Text(
                    '${product.star}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      _favourite = !_favourite;
                    },
                    child: Icon(
                      _favourite == true
                          ? CupertinoIcons.heart
                          : CupertinoIcons.heart_fill,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

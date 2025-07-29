import 'package:e_commerce_app/data/models/product_details_model.dart';
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

  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    bool favourite = false;
    List<String> photos = product.photos ?? [];

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
                  image: NetworkImage(photos.isNotEmpty
                      ? photos[0]
                      : "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: product.title!.length >= 10
                  ? Text("${product.title!.substring(0, 10)}...")
                  : Text(product.title!),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Wrap(
                children: [
                  Text(
                    '\$${product.currentPrice}',
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
                    '${product.quantity}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      favourite = !favourite;
                    },
                    child: Icon(
                      favourite == true
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

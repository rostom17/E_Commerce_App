import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    required this.name,
    required this.imageLink,
    super.key,
  });

  final String name;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          //padding: EdgeInsets.all(12),
          height: 80,
          width: Get.width * .18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorTheme.appColorTheme.withOpacity(.15),
          ),
          child: Image.network(
            imageLink,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Icon(Icons.broken_image),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}

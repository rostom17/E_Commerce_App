import 'package:e_commerce_app/data/models/category_list_data_model.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/cupertino.dart';
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
          height: 80,
          width: Get.width * .18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColorTheme.appColorTheme.withOpacity(.15),
            image: DecorationImage(
                image: NetworkImage(
                  imageLink,
                ),
                fit: BoxFit.cover),
          ),
          // child: Icon(
          //   CupertinoIcons.bed_double,
          //   size: 40,
          //   color: AppColorTheme.appColorTheme.withOpacity(.9),
          // ),
        ),
        Text(name),
      ],
    );
  }
}

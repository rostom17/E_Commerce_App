import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppbarWidgetForHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidgetForHomeScreen({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(ImagePaths.craftyBayIconSVG),
      actions: [
        _buildCircleAvatar(const Icon(CupertinoIcons.bell), "notification"),
        const SizedBox(
          width: 10,
        ),
        _buildCircleAvatar(const Icon(CupertinoIcons.phone), "phoneCall"),
        const SizedBox(
          width: 10,
        ),
        _buildCircleAvatar(const Icon(CupertinoIcons.person), "profile"),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  CircleAvatar _buildCircleAvatar(Icon icon, String screen) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
        child: IconButton(
          onPressed: () {
            if(screen == "profile") {
              Get.toNamed('/userProfile');
            }
            else if(screen == "phoneCall") {

            }
            else {

            }
          },
          icon: icon,
          // color: AppColorTheme.appColorTheme,
        ),
      );
  }
}

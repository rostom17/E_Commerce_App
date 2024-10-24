import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .1,
                ),
                SvgPicture.asset(
                  ImagePaths.logoImage,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Please Enter Your Email",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFormField("First Name"),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFormField("Last Name"),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFormField("Mobile"),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFormField("Shipping Address"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Complete",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(String info) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: info,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
        fillColor: Colors.transparent,
        filled: true,

      ),
      maxLines: info == "Shipping Address" ? 3 : 1,
    );
  }
}

import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmailValidationScreen extends StatefulWidget {
  const EmailValidationScreen({super.key});

  @override
  State<EmailValidationScreen> createState() => _EmailValidationScreenState();
}

class _EmailValidationScreenState extends State<EmailValidationScreen> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _onPressedNextButton () async {
    if(_formKey.currentState!.validate()) {
      
    }


      //Get.toNamed('/otpValidationScreen');

  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Form(
            child: Column(
              key: _formKey,
              children: [
                SizedBox(
                  height: Get.height * .25,
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
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      hintText: "Email Address",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorTheme.appColorTheme)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColorTheme.appColorTheme)),
                      fillColor: Colors.transparent,
                      filled: true),
                    validator: (String? value) {
                      if(value?.trim().isEmpty == true) {
                        return "Email can't be empty!";
                      }
                      else {
                        return null;
                      }
                    },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _onPressedNextButton,
                  child: const Text(
                    "Next",
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
}

import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/login_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailCrontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = Get.find<LoginController>();

  Future<void> _onPressedLoginButton() async {
    if (_formKey.currentState!.validate()) {
      final bool result = await _controller.loginRequest(
          email: _emailCrontroller.text.trim(),
          password: _passwordController.text);
      if (result) {
        if (mounted) {
          Get.back(result: true);
        }
      } else {
        Get.snackbar(
          "${_controller.errorMessage} : ${_controller.statusCode}",
          _controller.errorMessage ?? "No Message",
        );
      }
    }
  }

  @override
  void dispose() {
    _emailCrontroller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .15,
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
                _buildTextFromField(
                  hintText: "Email Address",
                  tec: _emailCrontroller,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                    hintText: "Password",
                    tec: _passwordController,
                    isPassword: true),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<LoginController>(builder: (controller) {
                  return Visibility(
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    visible: !controller.emailVerificationInProgress,
                    child: ElevatedButton(
                      onPressed: _onPressedLoginButton,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFromField(
      {required String hintText,
      required TextEditingController tec,
      bool isPassword = false}) {
    return TextFormField(
      controller: tec,
      obscureText: isPassword,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
          fillColor: Colors.transparent,
          filled: true),
      validator: (String? value) {
        if (value?.trim().isEmpty == true) {
          return "$hintText can't be empty!";
        } else if (!isPassword && Urls.emailChecker.hasMatch(value!) == false) {
          return "Enter valid email";
        } else {
          return null;
        }
      },
    );
  }
}

import 'package:e_commerce_app/data/utilities/urls.dart';
import 'package:e_commerce_app/presentation/state_holders/auth_controller/signup_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailCrontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _onPressedSignUpButton(SignupController signUpController) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Map<String, dynamic> requestBody = {
        "first_name": _firstNameController.text.trim(),
        "last_name": _lastNameController.text.trim(),
        "email": _emailCrontroller.text.trim(),
        "phone": _phoneNumberController.text.trim(),
        "city": _addressController.text.trim(),
        "password": _passwordController.text
      };
      final bool isSuccessful =
          await signUpController.signUpRequest(requstBody: requestBody);
      if (isSuccessful) {
        Get.toNamed("/otpValidationScreen",
            arguments: _emailCrontroller.text.trim());
      } else {
        Get.snackbar("Failed: ",
            "${signUpController.statusCode}:${signUpController.errorMessage}");
      }
    }
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
                const SizedBox(height: 20),
                SvgPicture.asset(
                  ImagePaths.logoImage,
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                  hintText: "First Name",
                  tec: _firstNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                  hintText: "Last Name",
                  tec: _lastNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                    hintText: "Email", tec: _emailCrontroller, isEmail: true),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                  hintText: "Phone",
                  tec: _phoneNumberController,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildTextFromField(
                  hintText: "Address",
                  tec: _addressController,
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
                GetBuilder<SignupController>(builder: (signUpController) {
                  return Visibility(
                    replacement:
                        const Center(child: CircularProgressIndicator()),
                    visible: !signUpController.signupInProgress,
                    child: ElevatedButton(
                      onPressed: () => _onPressedSignUpButton(signUpController),
                      child: const Text(
                        "Sign Up",
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
      bool isEmail = false,
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
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          fillColor: Colors.transparent,
          filled: true),
      validator: (String? value) {
        if (value?.trim().isEmpty == true) {
          return "$hintText can't be empty!";
        } else if (isEmail && Urls.emailChecker.hasMatch(value!) == false) {
          return "Enter valid email";
        } else {
          return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailCrontroller.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}

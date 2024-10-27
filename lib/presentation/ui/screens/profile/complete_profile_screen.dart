import 'package:e_commerce_app/presentation/state_holders/auth_controller/create_profile_controller.dart';
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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _shipAddress = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _postCode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final String _accessToken = Get.arguments;

  @override
  void dispose() {
    _name.dispose();
    _mobile.dispose();
    _shipAddress.dispose();
    _city.dispose();
    _state.dispose();
    _postCode.dispose();
    super.dispose();
  }

  Future<void> _onPressedSubmitButton() async {
    if (_formKey.currentState!.validate() == true) {
      Map<String, dynamic> _userInputData = {
        "cus_name": _name.text,
        "cus_add": _shipAddress.text,
        "cus_city": _city.text,
        "cus_state": _state.text,
        "cus_postcode": _postCode.text,
        "cus_country": _state.text,
        "cus_phone": _mobile.text,
        "cus_fax": _mobile.text,
        "ship_name": _name.text,
        "ship_add": _shipAddress.text,
        "ship_city": _city.text,
        "ship_state": _state.text,
        "ship_postcode": _postCode.text,
        "ship_country": _state.text,
        "ship_phone": _mobile.text
      };
      bool result = await Get.find<CreateProfileController>()
          .createProfileRequest(_accessToken, _userInputData);
      if(result) {
        dispose();
        Get.offAllNamed('/bottomNavScreen');
        Get.snackbar("Congrats", "Update Profile Complete\nFind your desired product");
      } else {
        Get.snackbar("Failed", "Try Again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Form(
              key: _formKey,
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
                  _buildTextFormField("Full Name", _name),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField("Mobile", _mobile, isNumber: true),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField("Shipping Address", _shipAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField("City", _city),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField("State / Country", _state),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField("Post Code", _postCode, isNumber: true),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<CreateProfileController>(
                    builder: (controller) {
                      return Visibility(
                        visible: !controller.createProfileInProgress,
                        replacement: const Center(child: CircularProgressIndicator(),),
                        child: ElevatedButton(
                          onPressed: _onPressedSubmitButton,
                          child: const Text(
                            "Complete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String info, TextEditingController controller,
      {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: info,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColorTheme.appColorTheme)),
        fillColor: Colors.transparent,
        filled: true,
      ),
      validator: (String? val) {
        if (val?.trim().isEmpty == true) {
          return "Field can't be empty";
        } else {
          return null;
        }
      },
      maxLines: info == "Shipping Address" ? 2 : 1,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
    );
  }
}

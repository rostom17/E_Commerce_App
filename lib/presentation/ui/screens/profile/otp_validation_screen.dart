import 'package:e_commerce_app/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({
    super.key,
  });

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  final TextEditingController _pinTEc = TextEditingController();
  String email = Get.arguments;

  Future<void> _onPressedNextButton(
      OtpVerificationController otpVerificationController) async {
    final isSuccessful = await otpVerificationController.otpVerificationRequest(
        email: email, otp: _pinTEc.text);
    if (isSuccessful) {
      Get.snackbar("Contrats", "You are now a part of Crafty Bay family");
      Get.offNamedUntil("/userProfile", (route) => route.isFirst,
          arguments: true);
    } else {
      Get.snackbar("Failed",
          "${otpVerificationController.statusCode} ${otpVerificationController.errorMessage}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
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
                "Enter OTP Code",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Default OTP is 1 2 3 4",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PinCodeTextField(
                  controller: _pinTEc,
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  useHapticFeedback: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor:
                        AppColorTheme.appColorTheme.withAlpha(155),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  appContext: context,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<OtpVerificationController>(builder: (controller) {
                return Visibility(
                  visible: !controller.optVerificationInProgress,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () => _onPressedNextButton(controller),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

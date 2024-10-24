import 'dart:math';

import 'package:e_commerce_app/presentation/state_holders/auth_controller/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpValidationScreen extends StatefulWidget {
  const OtpValidationScreen({super.key,});

  @override
  State<OtpValidationScreen> createState() => _OtpValidationScreenState();
}

class _OtpValidationScreenState extends State<OtpValidationScreen> {
  final TextEditingController _pinTEc = TextEditingController();
  String email = Get.arguments;
  final _controller = Get.find<OtpVerificationController>();

  Future<void> _onPressedNextButton () async {
    final bool result = await _controller.otpVerificationRequest(email, _pinTEc.text);
    if(result) {
      if(mounted) {
        Get.toNamed('/completeProfileScreen');
      }
    } else {
      Get.snackbar("Something Went Wrong", _controller.errorMessage ?? " " );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height*.25,),
              SvgPicture.asset(ImagePaths.logoImage, height: 100,),
              const SizedBox(height: 20,),
              Text("Enter OTP Code", style: Theme.of(context).textTheme.headlineSmall,),
              const SizedBox(height: 20,),
              Text("A 6 Digit Code has been Sent to Your Email",style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20,),

              PinCodeTextField(
                controller: _pinTEc,
                keyboardType: TextInputType.number,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                useHapticFeedback: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.grey.shade200,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.grey.shade400,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                appContext: context,
              ),

              const SizedBox(height: 20,),
              Visibility(
                visible: !_controller.optVerificationInProgress,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: ElevatedButton(
                  onPressed: _onPressedNextButton,
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

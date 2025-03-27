import 'package:e_commerce_app/presentation/state_holders/auth_controller/authentication_controller.dart';
import 'package:e_commerce_app/presentation/ui/utilities/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Get.find<AuthenticationController>().getAccessToken();
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed('/bottomNavScreen');
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(ImagePaths.logoImage),
              const Spacer(),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

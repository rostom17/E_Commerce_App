import 'package:e_commerce_app/controller_bindings.dart';
import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/profile/complete_profile_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/profile/login_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/profile/otp_validation_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/profile/sign_up_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/profile/user_profile_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/review_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:e_commerce_app/presentation/ui/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Crafty Bay",
      theme: lightTheme(),
      home: const SplashScreen(),
      initialRoute: '/',
      initialBinding: ControllerBindings(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/bottomNavScreen', page: () => const BottomNavScreen()),
        GetPage(name: '/userProfile', page: () => const UserProfileScreen()),
        GetPage(name: '/loginScreen', page: () => const LoginScreen()),
        GetPage(name: '/signUpScreen', page: () => const SignUpScreen()),
        GetPage(
            name: '/otpValidationScreen',
            page: () => const OtpValidationScreen()),
        GetPage(
            name: '/completeProfileScreen',
            page: () => const CompleteProfileScreen()),
        GetPage(name: '/reviewScreen', page: () => const ReviewScreen()),
      ],
    );
  }
}

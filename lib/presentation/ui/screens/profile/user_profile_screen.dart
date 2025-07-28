import 'package:e_commerce_app/data/models/user_models/user_data.dart';
import 'package:e_commerce_app/data/services/secure_storage_service.dart';
import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserData? userData;

  Future<void> _retriveUserData() async {
    userData = await SecureStorageService.getUserData();
    setState(() {});
  }

  @override
  void initState() {
    _retriveUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: _buildDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildTopGradiantDesign(),
            //_buildAppDrawerFuntionality(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * .2,
                  ),
                  _buildProfileImage(),
                  const SizedBox(
                    height: 20,
                  ),
                  userData != null
                      ? Column(
                          children: [
                            _buildRow(
                                context,
                                "${userData!.firstName} ${userData!.lastName}",
                                CupertinoIcons.person),
                            _buildDivider(),
                            _buildRow(context, userData!.phone ?? " ",
                                Icons.phone_android_sharp),
                            _buildDivider(),
                            _buildRow(context, userData!.city ?? " ",
                                Icons.apartment),
                            _buildDivider(),
                            _buildRow(context, userData!.email ?? " ",
                                CupertinoIcons.mail),
                            _buildDivider(),
                            const SizedBox(
                              height: 40,
                            ),
                            _buildEditProfileButton(),
                          ],
                        )
                      : const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Welcome to Crafty Bay.!",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                  const SizedBox(
                    height: 0,
                  ),
                  userData != null
                      ? _buildLogoutButton()
                      : Column(
                          children: [
                            _loginButton(),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Do not have account?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: AppColorTheme.appColorTheme),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildTopGradiantDesign() {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.greenAccent,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(200, 120),
            bottomRight: Radius.elliptical(200, 120),
          )),
    );
  }

  Container _buildProfileImage() {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(60),
        image: const DecorationImage(
            image: AssetImage('assets/images/panda.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  ElevatedButton _loginButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/loginScreen')!.then((val) {
          _retriveUserData();
        });
      },
      style: elevatedButtonStyle,
      child: const Text(
        "Login",
      ),
    );
  }

  ElevatedButton _buildEditProfileButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/completeProfileScreen',
            arguments: SecureStorageService.getAccessToken());
      },
      style: elevatedButtonStyle,
      child: const Text(
        "Edit Profile",
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 40,
      color: Colors.deepPurple.shade100,
    );
  }

  Row _buildRow(BuildContext context, String info, IconData myIcon) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Icon(
          myIcon,
          size: 30,
          color: AppColorTheme.appColorTheme,
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return TextButton(
      onPressed: () async {
        await SecureStorageService.deleteUserData();
        _retriveUserData();
      },
      child: const Text(
        "Logout.!",
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }

  final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: AppColorTheme.appColorTheme,
      foregroundColor: Colors.white,
      fixedSize: Size.fromWidth(Get.width * .9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)));
}

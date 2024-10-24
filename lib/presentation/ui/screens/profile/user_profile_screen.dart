import 'package:e_commerce_app/presentation/ui/utilities/app_color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.height * .25,
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
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * .2,
                  ),
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(60),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/panda.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildRow(context, "Dummy Name", CupertinoIcons.person),
                  _buildDivider(),
                  _buildRow(context, "+8801712345567", Icons.phone_android_sharp),
                  _buildDivider(),
                  _buildRow(context, "Address", Icons.apartment),
                  _buildDivider(),
                  _buildRow(context, "Email", CupertinoIcons.mail),
                  _buildDivider(),
                  _buildRow(context, "Password", CupertinoIcons.eye),
                  _buildDivider(),
                  SizedBox(height: Get.height * .18),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColorTheme.appColorTheme,
                      fixedSize:  Size.fromWidth(Get.width * .9),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(height: 0,),
                  TextButton(onPressed: (){
                    Get.toNamed('/emailValidationScreen');
                  },
                    child: const Text("Login Account?",style: TextStyle(decoration: TextDecoration.underline),),),

                  const SizedBox(height: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return  Divider(
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
}

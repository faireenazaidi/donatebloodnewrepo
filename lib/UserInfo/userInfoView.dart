import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:donationdiversity/UserInfo/userInfoController.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/text_theme.dart';

class UserInfoView extends GetView<UserInfoController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor('DDB887')),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/ddlogo.png",
                            height: 140,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text("User Info", style: MyTextTheme.veryLargeWCN, textAlign: TextAlign.center),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryTextField(
                          controller: controller.usernameController,
                          prefixIcon: Icon(Icons.person_outline_rounded),
                          backgroundColor: Colors.white,
                          hintText: "Enter your name",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryTextField(
                          controller: controller.emailController,
                          prefixIcon: Icon(Icons.email_outlined),
                          backgroundColor: Colors.white,
                          hintText: "Enter your email",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryTextField(
                          controller: controller.addressController,
                          prefixIcon: Icon(Icons.location_on_outlined),
                          backgroundColor: Colors.white,
                          hintText: "Enter your address",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Address is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryTextField(
                          controller: controller.idController,
                          prefixIcon: Icon(Icons.account_box_outlined),
                          backgroundColor: Colors.white,
                          hintText: "Personal Id Number",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'ID is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: PrimaryTextField(
                          controller: controller.numberController,
                          prefixIcon: Icon(Icons.phone),
                          backgroundColor: Colors.white,
                          hintText: "Enter your Number",
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (!RegExp(r'^\+?1?\d{9,15}$').hasMatch(value)) {
                              return 'Enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton(
                          borderRadius: 10,
                          elevation: 2,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              //Get.toNamed(AppRoutes.dashboardRoute);
                              controller.register(context);
                            }
                          },
                          title: "Submit Details",
                          color: AppColor.buttonColor,
                          suffixIcon: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

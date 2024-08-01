import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Routes/app_routes.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.black,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
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
                    Text(
                      "Login",
                      style: MyTextTheme.veryLargeWCN,
                    ),
                    SizedBox(height: 40),
                    PrimaryTextField(
                      controller: controller.usernameController,
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Enter your email",
                      backgroundColor: Colors.white,
                      obscureText: false,
                    ),
                    SizedBox(height: 20),
                    PrimaryTextField(
                      controller: TextEditingController(),
                        onChanged: (value) => controller.pass.value = value,
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      hintText: "Enter password",
                      obscureText: controller.isPassObscured.value,
                      suffixIcon: IconButton(
                        icon: Icon(controller.isPassObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          controller.togglePassVisibility();
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(() => GestureDetector(
                          onTap: () {
                            controller.isChecked.value = !controller.isChecked.value;
                            print("VALUE ${controller.isChecked.value}");
                          },
                          child: Container(
                            width: 22.0,
                            height: 22.0,
                            decoration: BoxDecoration(
                              color: controller.isChecked.value
                                  ? Colors.transparent
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: controller.isChecked.value
                                ? Icon(
                              Icons.check,
                              size: 18.0,
                              color: Colors.green,
                            )
                                : null,
                          ),
                        )),
                        SizedBox(width: 8),
                        Text(
                          "Remember me",
                          style: MyTextTheme.mediumBCN,
                        ),
                        Spacer(),
                        Text(
                          "Forgot Password?",
                          style: MyTextTheme.mediumBCN,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    MyButton(
                      borderRadius: 10,
                      elevation: 2,
                      onPressed: () {
                        controller.login(context);
                      },
                      title: "Sign in",
                      color: AppColor.buttonColor,
                      suffixIcon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            indent: 120,
                            endIndent: 0,
                            thickness: 0.6,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "or",
                          style: MyTextTheme.mediumBCN,
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            endIndent: 110,
                            indent: 10,
                            thickness: 0.6,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Don't have an account,",
                        style: MyTextTheme.mediumWCN,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signUpRoute);
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Register here!",
                          style: MyTextTheme.largeBCB,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

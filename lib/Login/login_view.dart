import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Routes/app_routes.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';
import '../Widgets/userStorage.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 40),
                    Text(
                      "Login",
                      style: MyTextTheme.veryLargeWCN,
                    ),
                    const SizedBox(height: 40),
                    PrimaryTextField(
                      controller: controller.usernameController,
                      prefixIcon: const Icon(Icons.email_outlined),
                      hintText: "Enter your email",
                      backgroundColor: Colors.white,
                      obscureText: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter an email';
                        }
                        final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!regex.hasMatch(value)) {
                          return '*Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return PrimaryTextField(
                        controller: controller.passwordController,
                        onChanged: (value) => controller.pass.value = value,
                        prefixIcon: const Icon(Icons.lock_outline_rounded),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Please enter a password';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 20),
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
                                ? const Icon(
                              Icons.check,
                              size: 18.0,
                              color: Colors.green,
                            )
                                : null,
                          ),
                        )),
                        const SizedBox(width: 8),
                        Text(
                          "Remember me",
                          style: MyTextTheme.mediumBCN,
                        ),
                        const Spacer(),
                        Text(
                          "Forgot Password?",
                          style: MyTextTheme.mediumBCN,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    MyButton(
                      borderRadius: 10,
                      elevation: 2,
                      title: "Sign in",
                      color: AppColor.buttonColor,
                      suffixIcon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        controller.login(context);
                        // final secureStorage = SecureStorageService();
                        // await secureStorage.saveLoginStatus(true);
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(
                            color: Colors.white,
                            indent: 120,
                            endIndent: 0,
                            thickness: 0.6,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "or",
                          style: MyTextTheme.mediumBCN,
                        ),
                        const Expanded(
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

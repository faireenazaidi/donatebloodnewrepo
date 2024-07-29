import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';
import 'password_Controller.dart';

class PasswordView extends GetView<PasswordController> {
  PasswordView({super.key});

  final PasswordController passwordController = Get.put(PasswordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: HexColor('DDB887')),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "assets/ddlogo.png",
                            height: 135,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text("Create Password", style: MyTextTheme.veryLargeWCN),
                      SizedBox(height: 30),
                      Obx(
                            () => PrimaryTextField(
                              controller: controller.passwordC,
                          minLength: 4,
                          maxLength: 12,
                          onChanged: (value) => controller.password.value = value,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Enter Password",
                          obscureText: controller.isPasswordObscured.value,
                          backgroundColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordObscured.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 4) {
                              return 'Password must be at least 4 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      Obx(
                            () => PrimaryTextField(
                              controller: controller.confirmPasC,
                          minLength: 4,
                          maxLength: 12,
                          onChanged: (value) => controller.confirmPassword.value = value,
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Confirm Password",
                          obscureText: controller.isConfirmObscured.value,
                          backgroundColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(controller.isConfirmObscured.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              controller.toggleConfirmPasswordVisibility();
                            },
                          ),

                          validator: (value)
                          {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password is required';
                            }
                            // if (value.length < 4) {
                            //   return 'Confirm Password must be at least 4 characters';
                            // }
                            if (value != controller.password.value) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      MyButton(
                        borderRadius: 10,
                        elevation: 2,
                        width: 353,
                        onPressed: () {
                          print(controller.confirmPasC.value.text.toString());
                          if (_formKey.currentState?.validate() ?? false) {

                            controller.comparePasswords(controller.confirmPasC.value.text);
                           // Get.toNamed(AppRoutes.userInfoRoute);
                            // Get.toNamed(AppRoutes.dashboardRoute);
                          }
                          else{
                            Get.snackbar("Validation Error", "Please try again");
                          }
                        },
                        title: "Create Account",
                        color: AppColor.buttonColor,
                        suffixIcon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

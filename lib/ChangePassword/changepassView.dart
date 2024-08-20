import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import 'changePassController.dart';

class ChangePassView extends GetView<ChangePassController> {
  ChangePassView({super.key});

  final ChangePassController changePassController = Get.put(
      ChangePassController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 160,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.tile4Color,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 60),
                                      PrimaryTextField(
                                        hintText: "New Password",
                                        obscureText: true,
                                        onChanged: (value) {
                                          changePassController.newPassword
                                              .value = value;
                                        },
                                      ),
                                  SizedBox(height: 10),
                                      PrimaryTextField(
                                        hintText: "Confirm Password",
                                        obscureText: true,
                                        onChanged: (value) {
                                          changePassController.confirmPassword
                                              .value = value;
                                        },
                                      ),
                                  SizedBox(height: 15),
                                  Obx(() =>
                                      MyButton(
                                        borderRadius: 10,
                                        elevation: 2,
                                        onPressed: () async {
                                          await changePassController
                                              .changePassword();
                                        },
                                        title: changePassController.isLoading
                                            .value
                                            ? "Saving..."
                                            : "Save",
                                        color: AppColor.buttonColor,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40, // Adjust position vertically
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.key_sharp,
                              size: 55,
                              color: AppColor.buttonColor,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 40,
                            child: Text(
                              "Reset Password",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

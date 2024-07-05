
import 'dart:math';

import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Widgets/app_color.dart';
import '../Widgets/myButton.dart';
import '../Widgets/primary_text_field.dart';
import 'login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  // Getter for _isChecked

    @override
    Widget build(BuildContext context) {


      // TODO: implement build

      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                  height: Get.height, width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
              ),
                  Container(
                    color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
                  ),
                   SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, left: 8.0, right: 8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: HexColor('DDB887')),
                                borderRadius: BorderRadius.circular(15),

                              ),

                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),

                                  child: Image.asset(
                                    "assets/ddlogo.png", height: 140,)),
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            Text("Login", style: MyTextTheme.veryLargeWCN,),
                            SizedBox(
                              height: 40,
                            ),
                            PrimaryTextField(
                              prefixIcon: Icon(Icons.phone_android_rounded),
                              hintText: "Enter mobile number",
                              backgroundColor: Colors.white,
                              ),
                            SizedBox(
                              height: 20,
                            ),

                            PrimaryTextField(
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              hintText: "Enter password",
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(
                                ()=>
                                    GestureDetector(
                        onTap: () {
                          controller.isChecked.value = !controller.isChecked.value;
                          print("VALUE ${controller.isChecked.value}");
                   },  child: Container(
                                      width: 22.0,
                                      height: 22.0,
                                      decoration: BoxDecoration(
                                        color: controller.isChecked.value ? Colors.transparent : Colors.transparent,
                                        border: Border.all(
                                          color: Colors.white,width: 2.0 // Border color

                                        ),
                                        borderRadius: BorderRadius.circular(2.0), // Match Checkbox border radius
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
                                SizedBox(width: 8,),
                                Text(
                                  "Remember me", style: MyTextTheme.mediumBCN,),
                               Spacer(),
                               Text("Forgot Password?",
                                    style: MyTextTheme.mediumBCN)
                              ],
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            MyButton(
                              borderRadius: 10,
                              elevation: 2,
                              // width: 300,
                              // height: 10,
                              onPressed: () {},
                              title: "Sign in",
                              color: AppColor.buttonColor,
                              suffixIcon: Icon(
                                Icons.arrow_forward, color: Colors.white,),),

                            SizedBox(
                              height: 15,
                            ),
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
                                  SizedBox(
                                    width: 10,
                                  ),

                                  Text("or", style: MyTextTheme.mediumBCN,),

                                  Expanded(
                                      child: Divider(
                                        color: Colors.white,
                                        endIndent: 110,
                                        indent: 10,
                                        thickness: 0.6,
                                      )
                                  ),
                                ]
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                                child: Text("Don't have an account,", style: MyTextTheme.mediumWCN)),
                            InkWell(
                              onTap: (){
                                Get.toNamed(AppRoutes.signUpRoute);
                              },
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text("Register here!",style: MyTextTheme.largeBCB,),
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
          ]
              )
          )
      );
    }

  void setState(Null Function() param0) {}
    
  }


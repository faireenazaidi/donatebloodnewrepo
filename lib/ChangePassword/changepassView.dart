import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'changePassController.dart';

class ChangePassView extends GetView<ChangePassController>{
  ChangePassView({super.key});
  final ChangePassController changePassController = Get.put(ChangePassController());



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body:
            Stack(
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
                                    decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.tile4Color,
                                    ),
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                           PrimaryTextField(
                                            hintText: "New Password",
                                            obscureText: false,
                                          ),
                                           SizedBox(
                                            height: 10,
                                          ),
                                           PrimaryTextField(
                                            hintText: "Confirm Password",
                                            obscureText: false,
                                          ),
                                           SizedBox(
                                            height: 15,
                                          ),
                                          MyButton(
                                            borderRadius: 10,
                                            elevation: 2,
                                            onPressed: (){
                                            },
                                            title: "Save",
                                            color: AppColor.buttonColor,
                                          ),
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
                                  child: Icon(Icons.key_sharp,size: 50,color: AppColor.buttonColor,),
                                ),
                              ),

                              Positioned(
                                  top:40,
                                  child: Text("Reset Password",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))
                            ],
                          ),
  ]
                      )
                      ),
                                        ),
              ],
            )
        ));


  }
}


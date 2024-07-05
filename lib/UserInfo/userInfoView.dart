import 'package:donationdiversity/UserInfo/userInfoController.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/text_theme.dart';

class UserInfoView extends GetView<UserInfoController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
      SafeArea(
        child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: Get.height,width: Get.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.fitHeight
                  )
              ),
            ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 30.0, left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: HexColor('DDB887')
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),

                          child: Image.asset(
                            "assets/ddlogo.png", height: 135,)),
          ),
                      SizedBox(
                        height: 40,
                      ),

                      Text("User Info", style: MyTextTheme.veryLargeWCN,),
                      SizedBox(
                        height: 30,
                      ),
                    PrimaryTextField(
                      prefixIcon: Icon(Icons.person_outline_rounded,),
                      backgroundColor: Colors.white,
                      hintText: "Enter your name",
                    ),SizedBox(
                      height: 15,
                    ),
                    PrimaryTextField(
                      prefixIcon: Icon(Icons.email_outlined),
                      backgroundColor: Colors.white,
                      hintText: "Enter your email",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryTextField(
                      prefixIcon: Icon(Icons.location_on_outlined),
                      hintText:"Enter your address",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    PrimaryTextField(
                     prefixIcon: Icon(Icons.account_box_outlined),
                      hintText: "Personal Id Number",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MyButton(
                      borderRadius: 10,
                      elevation: 2,
                      onPressed: (){
                        Get.toNamed(AppRoutes.dashboardRoute);
                      },
                      title: "Submit Details",
                      color: AppColor.buttonColor,
                      suffixIcon: Icon(Icons.arrow_forward,color: Colors.white,),
                    ),

                  ],
                ),
              ),
            ),

        ]
        ),
            ),
      );
  }

}
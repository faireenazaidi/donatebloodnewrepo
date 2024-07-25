import 'package:donationdiversity/UserInfo/userInfoController.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/text_theme.dart';

class UserInfoView extends GetView<UserInfoController>{

  @override
  Widget build(BuildContext context) {
    Get.put(UserInfoController());
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
                child: ListView(
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
                        height: 10,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextField(
                        controller: controller.usernameController,
                        prefixIcon: Icon(Icons.person_outline_rounded,),
                        backgroundColor: Colors.white,
                        hintText: "Enter your name",
                        obscureText: false,

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextField(
                        controller: controller.emailController,
                        prefixIcon: Icon(Icons.email_outlined),
                        backgroundColor: Colors.white,
                        hintText: "Enter your email",
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextField(
                        controller: controller.addressController,
                        prefixIcon: Icon(Icons.location_on_outlined),
                        hintText:"Enter your address",
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextField(
                        controller: controller.idController,
                       prefixIcon: Icon(Icons.account_box_outlined),
                        hintText: "Personal Id Number",
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryTextField(
                        controller: controller.numberController,
                        prefixIcon: Icon(Icons.phone),
                        hintText: ("Enter your Number"),
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        borderRadius: 10,
                        elevation: 2,
                        onPressed: (){
                          Get.toNamed(AppRoutes.dashboardRoute);
                          controller.register(context);
                        },
                        title: "Submit Details",
                        color: AppColor.buttonColor,
                        suffixIcon: Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
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
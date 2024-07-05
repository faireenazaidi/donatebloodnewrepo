import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/createPassword/password_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Routes/app_routes.dart';
import '../Widgets/app_color.dart';
import '../Widgets/primary_text_field.dart';
import '../Widgets/text_theme.dart';

class PasswordView extends GetView<PasswordController> {
   PasswordView({super.key});

  get index => null;
  final PasswordController passwordController = Get.put(PasswordController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SafeArea(
     child: Scaffold(
       resizeToAvoidBottomInset: false,
       body: Stack(
         children:[ Container(
           height: Get.height, width: Get.width,
           decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/bg.png'),
                 fit: BoxFit.fitHeight,
               )
           ),
       ),
           Container(color: Colors.black.withOpacity(0.4),),
           SingleChildScrollView(
             child:Padding(
               padding: const EdgeInsets.only(
                   top: 30.0, left: 8.0, right: 8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(height: 40,),
                   Container(
                     decoration: BoxDecoration(
                       border: Border.all(color: HexColor('DDB887')),
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
                   Text("Create Password", style: MyTextTheme.veryLargeWCN,),
                   SizedBox(
                     height: 30,
                   ),
                   PrimaryTextField(
                     prefixIcon: Icon(Icons.lock_outline),
                     hintText: "Enter Password",
                     backgroundColor: Colors.white,
                     suffixIcon: Obx(
                           ()=> IconButton(
                         icon: Icon(
                             controller.isPassword.value?
                             Icons.visibility_off: Icons.visibility,
                         ),
                         onPressed: (){
                             controller.isPassword.value = ! controller.isPassword.value;

                         },
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 15,
                   ),

             PrimaryTextField(
                     prefixIcon: Icon(Icons.lock_outline),
                     hintText: "Confirm Password",
                     backgroundColor: Colors.white,
                     suffixIcon: Obx(
                           ()=> IconButton(
                         icon: Icon(
                           controller.isPassword.value?
                           Icons.visibility_off: Icons.visibility,
                         ),
                         onPressed: (){
                           controller.isPassword.value = ! controller.isPassword.value;

                         },
                       ),
                     ),
                   ),


                   SizedBox(
                     height: 20,
                   ),
                   MyButton(
                     borderRadius: 10,
                     elevation: 2,
                     width: 353,
                     onPressed: () {
                       Get.toNamed(AppRoutes.userInfoRoute);
                     },
                     title: "Create Account",
                     color: AppColor.buttonColor,
                     suffixIcon: Icon(
                       Icons.arrow_forward, color: Colors.white,),),

                 ],
               ),
             ),
           )
              ]
         ),
       ),
   );
  }

  void setState(Null Function() param0) {}

}

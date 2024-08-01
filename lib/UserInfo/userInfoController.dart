import 'dart:convert';
import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../Widgets/app_util.dart';

class UserInfoController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController numberController = TextEditingController();


  App app = App();


  register(context)  async {
    var pass = Get.arguments[0];

    var body = {

            "firstName":usernameController.text.toString(),
            "lastName":"",
            "email":emailController.text.toString(),
            "mobile":numberController.text.toString(),
            "address":addressController.text.toString(),
            "personalId":idController.text.toString(),
            "password": pass,
            "catId":"1"
        };


var data = await app.api("API/Login/registerUser", body, context);
     print(data.toString());
     if(data['status'] == 'success'){
       Get.toNamed(AppRoutes.dashboardRoute);
     }
     else
       {
         Get.snackbar("Error", "Registration failed, Please try again later");
       }
  }

}

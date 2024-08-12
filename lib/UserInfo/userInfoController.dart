
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
    var pass = Get.arguments;

    var body = {

            "firstName":usernameController.text.toString(),
            "lastName":"",
            "email":emailController.text.toString(),
            "mobile":numberController.text.toString(),
            "address":addressController.text.toString(),
            "personalId":idController.text.toString(),
            "password": pass.toString(),
            "catId":"1"
        };


var data = await app.api("API/Login/registerUser", body, context,token: false);
    print("API Response: ${data.toString()}");
    if(data['responseCode'] == 200){
       Get.toNamed(AppRoutes.dashboardRoute);
      print("Yes");
     }else{
         print("No");
         Get.snackbar("Error", data['message']);
       }
  }

}






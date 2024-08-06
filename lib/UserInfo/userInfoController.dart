import 'dart:convert';
import 'package:donationdiversity/Routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../Widgets/app_util.dart';

class UserInfoController extends GetxController{
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController numberController = TextEditingController();


  App app = App();

  register(context)  async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://5b42-14-97-58-74.ngrok-free.app/API/Login/registerUser'));
    request.body = json.encode({
      "firstName": "gxhccu",
      "lastName": "",
      "email": "faireenazaidi@gmail.com",
      "mobile": "816468854808",
      "address": "ueueud",
      "personalId": "hehdj",
      "password": "1",
      "catId": "1"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("@@@@@@@@@@@@@@@@@@");
    }
    else {
      print(response.reasonPhrase);
    }

  }

//   register(context)  async {
//     var pass = Get.arguments[0];
//
//     var body = {
//
//             "firstName":usernameController.text.toString(),
//             "lastName":"",
//             "email":emailController.text.toString(),
//             "mobile":numberController.text.toString(),
//             "address":addressController.text.toString(),
//             "personalId":idController.text.toString(),
//             "password": pass,
//             "catId":"1"
//         };
//
//
// var data = await app.api("API/Login/registerUser", body, context);
//     print("API Response: ${data.toString()}");
//     if(data['message'] == "success"){
//       // Get.toNamed(AppRoutes.dashboardRoute);
//       print("@@@@@@@@@@@@@@");
//      }
//      else
//        {
//          print("##############");
//         // Get.snackbar("Error", "Registration failed, Please try again later");
//        }
//   }

}


    // Debugging: Print the response to check its structure


    // Check if `data` is null or does not contain the expected key



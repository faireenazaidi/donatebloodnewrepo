
import 'dart:convert';
import 'package:donationdiversity/Widgets/userStorage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:donationdiversity/Routes/app_routes.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;
  RxBool isPassObscured = true.obs;
  var pass = ''.obs;

  void togglePassVisibility() {
    isPassObscured.value = !isPassObscured.value;
  }

  final storage = FlutterSecureStorage();

  void login(BuildContext context) async {
    var url = Uri.parse('https://f436-14-97-58-74.ngrok-free.app/API/Login/userLogin');

    try {
      // Send POST request to login endpoint
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": usernameController.text.toString(),
          "password": passwordController.text.toString(),
        }),
      );

      var jsonResponse = jsonDecode(response.body);
      print('Login successful: $jsonResponse');

      if (response.statusCode == 200) {
        print("@@@@@@@@" + jsonResponse.toString());
        print("@@@@@@@@" + jsonResponse['responseValue'].toString());
        print("@@@@@@@@" + jsonResponse['responseValue']['loginDetails'][0].toString());


        var dd = jsonResponse['responseValue']['loginDetails'][0];


        await UserStorage().addUserData(dd);
        print("sssssssssssss"+UserStorage().getUserData['firstName'].toString());
        print("sssssssssssss"+UserStorage().getUserName.toString());


        // Optionally, store username and password if checkbox is checked
        if (isChecked.value) {
          await storage.write(key: 'email', value: usernameController.text);
          await storage.write(key: 'password', value: passwordController.text);
        } else {
          await storage.delete(key: 'email');
          await storage.delete(key: 'password');
        }

        // Navigate to dashboard route
        Get.toNamed(AppRoutes.dashboardRoute);
      } else {
        print('Login failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
      Fluttertoast.showToast(
        msg: 'Please try again later',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.black,
      );
    }
  }

  Future<void> loadCredentials() async {
    String? email = await storage.read(key: 'email');
    String? password = await storage.read(key: 'password');

    if (email != null) {
      usernameController.text = email;
    }
    if (password != null) {
      passwordController.text = password;
      isChecked.value = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadCredentials();
  }
}




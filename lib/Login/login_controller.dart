import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http; // Import HTTP package for making requests
import 'package:shared_preferences/shared_preferences.dart';
import '../Routes/app_routes.dart';
import '../Widgets/app_util.dart';
import 'login_view.dart';

class LoginController extends GetxController {
  RxBool isChecked = true.obs;
  App app = App();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) async {
    var url = Uri.parse('https://4359-14-97-58-74.ngrok-free.app/Help/Api/POST-api-Login-userLogin');


    try {
      // Send POST request to login endpoint
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
        "userName": usernameController.text.toString(),
        "password": passwordController.text.toString(),

        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Login successful: $jsonResponse');
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('token', jsonResponse['token']);

        // Navigate to the next screen (replace with your route)
        // Get.toNamed(AppRoutes.homeRoute);
      } else {
        print('Login failed with status code ${response.statusCode}');
        // Example: Show error dialog
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text('Login Failed'),
        //     content: Text('Failed to login. Please check your credentials.'),
        //     actions: <Widget>[
        //       TextButton(
        //         child: Text('OK'),
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //       ),
        //     ],
        //   ),

      }
    } catch (e) {
      // Handle any exceptions thrown during the request
      print('Error during login: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Widgets/app_util.dart';

class LoginController extends GetxController {
  RxBool isChecked = true.obs;
  App app = App();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final storage = FlutterSecureStorage();

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

        // if (isChecked.value) {
        //   await storage.write(key: 'email', value: usernameController.text);
        //   await storage.write(key: 'password', value: passwordController.text);
        // } else {
        //   await storage.delete(key: 'email');
        //   await storage.delete(key: 'password');
        // }

        // Navigate to dashboard route
        Get.toNamed('/dashboardRoute');

      } else {
        print('Login failed with status code ${response.statusCode}');
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

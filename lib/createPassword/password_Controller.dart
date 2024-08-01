
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import '../Routes/app_routes.dart';

class PasswordController extends GetxController {

  TextEditingController passwordC =TextEditingController();
  TextEditingController confirmPasC =TextEditingController();

  final FlutterSecureStorage _storage = FlutterSecureStorage();
  RxBool isPasswordObscured = true.obs;
  RxBool isConfirmObscured = true.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  get value => null;

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }
  void toggleConfirmPasswordVisibility() {
    isConfirmObscured.value = !isConfirmObscured.value;
  }

  void comparePasswords(String pass) {
    if (password.value == confirmPassword.value) {
      // Get.snackbar("Success", 'Password match',
      //     snackPosition: SnackPosition.TOP,colorText: Colors.green);
      Get.toNamed(AppRoutes.userInfoRoute,arguments: pass);
    }
    else {
     Get.snackbar("Alert!", "Password don't match",
        snackPosition: SnackPosition.TOP,backgroundColor: Colors.white);
    }
  }
}

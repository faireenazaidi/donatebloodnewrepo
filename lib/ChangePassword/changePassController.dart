import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChangePassController extends GetxController {
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  Future<void> changePassword() async {
    if (newPassword.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse("https://b874-14-97-58-74.ngrok-free.app/API/"),
        body: {
          'new_password': newPassword.value,
          'confirm_password': confirmPassword.value,
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password changed successfully');
      } else {
        Get.snackbar('Error', 'Failed to change password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading.value = false;
    }
  }
}

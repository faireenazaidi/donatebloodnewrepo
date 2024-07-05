  import 'package:donationdiversity/createPassword/password_Controller.dart';
import 'package:get/get.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordController());
  }
}
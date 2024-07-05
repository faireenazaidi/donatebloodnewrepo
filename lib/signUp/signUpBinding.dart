import 'package:donationdiversity/signUp/signUpController.dart';
import 'package:get/get.dart';


class SignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
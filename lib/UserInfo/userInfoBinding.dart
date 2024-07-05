import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserInfoBinding());
  }
}
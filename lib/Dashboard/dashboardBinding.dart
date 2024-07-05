import 'package:donationdiversity/Dashboard/dashboardController.dart';
import 'package:donationdiversity/createPassword/password_Controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
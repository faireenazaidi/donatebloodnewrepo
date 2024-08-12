import 'package:donationdiversity/Profile/profileController.dart';
import 'package:get/get.dart';

class ProfileViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(()=> ProfileController());
  }

}


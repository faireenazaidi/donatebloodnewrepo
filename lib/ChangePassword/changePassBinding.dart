import 'package:get/get.dart';

import 'changePassController.dart';

class ChangePassBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(ChangePassController());
  }
}
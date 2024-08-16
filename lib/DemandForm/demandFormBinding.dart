import 'package:donationdiversity/DemandForm/demandFormController.dart';
import 'package:get/get.dart';


class DemandFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DemandFormController());
  }
}

import 'package:get/get.dart';
import 'category_Controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}

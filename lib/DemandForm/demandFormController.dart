import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DemandFormController extends GetxController {
  var itemsList = [].obs; // Observable list to store items fetched from API
  var selectedItem = ''.obs; // Observable to store the selected item

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // Fetch items when the controller is initialized
  }

  // Method to fetch items from the API
  void fetchItems() async {
    final response = await http.get(Uri.parse('https://f436-14-97-58-74.ngrok-free.app/API/demand/getItemList'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      // Assuming the API returns a list of items with a "name" key
      itemsList.value = data;
    } else {
      Get.snackbar('Error', 'Failed to fetch items');
    }
  }

  // Method to update the selected item
  void updateSelectedItem(value) {
    if (value != null) {
      selectedItem.value = value; // Store the selected item
    } else {
      selectedItem.value = '';
    }
  }
}

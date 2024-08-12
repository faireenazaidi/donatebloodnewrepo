import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var isEditing = false.obs;
  var profileData = {}.obs;
  var isLoading = false.obs;
  var firstName = 'Faireena'.obs;
  var lastName = 'Zaidi'.obs;
  var contact = '8173822136'.obs;
  var dob = '12-09-2003'.obs;
  var area = 'Sarfarazganj'.obs;
  var city = 'Lucknow'.obs;
  var country = 'India'.obs;
  var pinCode = '226003'.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');

    if (userId == null) {
      print('User ID not found');
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.get(Uri.parse('https://b142-14-97-58-74.ngrok-free.app/userProfile/getUserDetails/$userId'));

      if (response.statusCode == 200) {
        profileData.value = jsonDecode(response.body);
      } else {
        // Handle the error
        print('Failed to load profile data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }

  void updateProfile() {
  }
}

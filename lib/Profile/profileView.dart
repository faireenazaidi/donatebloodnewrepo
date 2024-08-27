import 'package:donationdiversity/Profile/profileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../Widgets/app_color.dart';
import '../Widgets/text_theme.dart';

class ProfileView extends GetView<ProfileController> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Colors.white,
        title: Text("Donor"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Obx(() => Text(
              "${controller.firstName.value} ${controller.lastName.value}",
              style: MyTextTheme.largeCustomBCB,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.red[900], size: 20),
                Text("faireenazaidi@gmail.com"),
              ],
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Container(
                height: 380,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Personal Information",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Obx(() => IconButton(
                            icon: Icon(
                              controller.isEditing.value
                                  ? Icons.check
                                  : Icons.edit,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              if (controller.isEditing.value) {
                                // Save profile updates
                                controller.updateProfile();
                              }
                              controller.toggleEditing();
                            },
                          )),
                        ],
                      ),
                      SizedBox(height: 10),

                      Obx(() => Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.firstName.value,
                              decoration:
                              InputDecoration(labelText: "First Name"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.firstName.value = value,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.lastName.value,
                              decoration:
                              InputDecoration(labelText: "Last Name"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.lastName.value = value,
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),

                      Obx(() => Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.contact.value,
                              decoration: InputDecoration(labelText: "Contact"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.contact.value = value,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.dob.value,
                              decoration: InputDecoration(labelText: "DOB"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.dob.value = value,
                            ),
                          ),
                        ],
                      )),
                      // Divider(thickness: 1, endIndent: 10),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),

                      Obx(() => Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.area.value,
                              decoration: InputDecoration(labelText: "Area"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.area.value = value,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.city.value,
                              decoration: InputDecoration(labelText: "City"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.city.value = value,
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),

                      Obx(() => Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.country.value,
                              decoration: InputDecoration(labelText: "Country"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.country.value = value,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              initialValue: controller.pinCode.value,
                              decoration:
                              InputDecoration(labelText: "PIN Code"),
                              enabled: controller.isEditing.value,
                              onChanged: (value) =>
                              controller.pinCode.value = value,
                            ),
                          ),
                        ],
                      )),

                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20,),
            // ElevatedButton(
            //   onPressed: () {
            //     controller.updateProfile();
            //   },
            //   child: Text("Save"),
            // ),
          ],
        ),
      ),
    );
  }
}

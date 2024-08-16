import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:donationdiversity/DemandForm/demandFormController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemandFormView extends GetView<DemandFormController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demand Form"),
        ),
        body: Column(
          children: [
            Obx(() {
              // Display the dropdown once items are loaded
              return controller.itemsList.isEmpty
                  ? CircularProgressIndicator() // Show a loader while data is being fetched
                  : CustomSearchableDropDown(
                dropdownHintText: 'Search For Name Here...',
                showLabelInMenu: true,
                primaryColor: Colors.red,
                menuMode: true,
                labelStyle: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                items: controller.itemsList, // Use the controller's itemsList
                label: 'Select Name',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.search),
                ),
                dropDownMenuItems: controller.itemsList.map((item) {
                  return item['name']; // Ensure this matches your data structure
                }).toList(),
                onChanged: (value) {
                  controller.updateSelectedItem(value); // Update selected item
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

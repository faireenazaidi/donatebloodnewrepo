import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/MyCustomSd.dart';
import 'demandFormController.dart';

class DemandFormView extends  GetView<DemandFormController> {
  const DemandFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final DemandFormController controller = Get.put(DemandFormController());

    return Scaffold(
      appBar: AppBar(title: Text('DropDown Example')),
      body: Center(
        child: MyCustomSd(
          listToSearch: controller.getItemSearch,
          valFrom: 'name',
          onChanged: (val){
            print("@@@@@@@@");
          },)
      ),
    );
  }
}

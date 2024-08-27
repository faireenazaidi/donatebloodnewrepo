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
      appBar: AppBar(title: const Text('Demand Form'),
        actions: [
          TextButton(
              onPressed: (){
                _showBottomPopUp();
              },
               child: Text("Click Me"),)
        ],
      ),
      body: Column(
        children: [Padding(
          padding: const EdgeInsets.all(8.0),


    ),

        ]
    )
    );
  }
  void _showBottomPopUp(){
    Get.bottomSheet(
      Container(
        height: 200,

        child:
        Obx((){
          return MyCustomSd(
            listToSearch: controller.getItemSearch.value,
            valFrom: 'name',
            onChanged: (val){
              print("@@@@@@@@"+val.toString());
            },);
        }),
      )

    );
  }
}
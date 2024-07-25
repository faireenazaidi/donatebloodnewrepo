import 'package:donationdiversity/Dashboard/dashboard.view.dart';
import 'package:donationdiversity/SplashScreen/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SplashScreen extends GetView<SplashController>{
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.off(DashboardView());
    });
   return Scaffold(
body:Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      SizedBox(height: 20),

    ],
  ),
),
   );
  }

}

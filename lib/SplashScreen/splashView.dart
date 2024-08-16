import 'package:donationdiversity/SplashScreen/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SplashScreen extends GetView<SplashController>{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return const Scaffold(
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

import 'package:donationdiversity/SplashScreen/splashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends GetView<SplashController>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body:Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Lottie.asset(
      //   'assets/animations/splash_animation.json', // Replace with your animation file
      //   width: 200, // Adjust width and height as necessary
      //   height: 200,
      //   fit: BoxFit.contain,
      // ),
      SizedBox(height: 20),
      Text(
        'Your App Name',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ],
  ),
),
   );
  }

}
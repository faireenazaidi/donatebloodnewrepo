import 'dart:async';

import 'package:donationdiversity/Widgets/userStorage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'Routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDdKjbjK-UyXXbNFtZL95Sc6bafTHn668w',
      appId: '1:429028966002:android:99e657eff26444574f0ceb',
      messagingSenderId: '429028966002',
      projectId: 'donation-diversity-324f1',
    ),
  );

  // Check if the user is logged in
  // final storage = FlutterSecureStorage();
  // String? loginDetails = await storage.read(key: 'loginDetails');
  // bool isLoggedIn = loginDetails != null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // initialRoute: isLoggedIn ? AppRoutes.dashboardRoute : AppRoutes.loginRoute,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    );
  }




}

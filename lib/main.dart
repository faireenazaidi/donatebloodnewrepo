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
  final storage = FlutterSecureStorage();
  String? loginDetails = await storage.read(key: 'loginDetails');
  bool isLoggedIn = loginDetails != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: isLoggedIn ? AppRoutes.dashboardRoute : AppRoutes.loginRoute,
      getPages: AppRoutes.pages,
    );
  }
}

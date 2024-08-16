import 'dart:async';

import 'package:get/get.dart';

import '../Routes/app_routes.dart';
import '../Widgets/userStorage.dart';

class SplashController extends GetxController{


  @override
  Future<void> onInit() async {

    super.onInit();
    pageRoute();
  }

  // pageRoute(){
  //   if(UserStorage().getUserData.isNotEmpty)
  //   {
  //     AppRoutes.dashboardRoute;
  //   } else{
  //     AppRoutes.loginRoute;
  //   }
  // }
  //
  // page()async{
  //   print("UserData: ${UserStorage().getUserId.toString()}");
  //   Timer(
  //       const Duration(seconds: 2),
  //           () => pageRoute()
  //   );
  // }


  pageRoute() async {
    print("UserData: ${UserStorage().getUserId.toString()}");
    Timer(const Duration(milliseconds: 2000), () {
      if (UserStorage().getUserId.toString().isEmpty) {
        Get.toNamed(AppRoutes.loginRoute);
      }else {
        Get.offNamed(AppRoutes.dashboardRoute);
      }
    });
  }


}
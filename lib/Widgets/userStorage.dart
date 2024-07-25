// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';
// import '../Login/login_view.dart';
//
//
// class UserStorage extends GetxController {
//   final userStorage = GetStorage('user');
//
//
//   addToken(String val) async{
//     await userStorage.write('userToken', val);
//     update();
//   }
//   String get getUserToken => (userStorage.read('userToken') ?? "") ;
//
//   addDeviceToken(String val) async{
//     await userStorage.write('deviceToken', val);
//     update();
//   }
//
//   String get getDeviceToken => (userStorage.read('deviceToken') ?? "") ;
//
//   addUserData(Map val) async {
//     await userStorage.write('userData', val);
//     update();
//   }
//
//   LoginView get getLoginUserStorage=>LoginView.fromJson(userStorage.read('userData')??{});
//
//   readUnreadCount(List<Map> val) async{
//     await userStorage.write('readUnreadCount', val);
//     update();
//   }
//
//   String get getReadUnreadCount => (userStorage.read('readUnreadCount') ?? "") ;
//
//   removeUserData() async{
//     await userStorage.remove('userData');
//     await userStorage.remove('userToken');
//     update();
//   }
//
//   addGetCurrentDatePendingBacklog(List val) async {
//     await userStorage.write('GetCurrentDatePendingBacklog', val);
//     update();
//   }
//
//   List<BacklogDetails> get userCurrentDatePendingBacklog=>List<BacklogDetails>.from(
//       userStorage.read('GetCurrentDatePendingBacklog').map((e)=>BacklogDetails.fromJson(e))
//   );
//
//
//   addCommentList(List val) async {
//     await userStorage.write('CommentList', val);
//     update();
//   }
//
//
//   List<ChatDataModal> get userCommentList=>List<ChatDataModal>.from(
//       userStorage.read('CommentList').map((e)=>ChatDataModal.fromJson(e)),
//   if (responseData.statusCode == 200) {
//   print("Faireena${responseData.body}");
//   ProgressDialogue().hide();
//   userStorage().addToken(responseData.body['token']);
//   userStorage().addUserData(responseData.body['responseValue'][0]);
//   userStorage().addDeviceToken(token.toString());
//   Get.log(userStorage().getLoginUserData.name.toString());
//   Get.log(userStorage().getUserToken.toString());
//   print("DeviceToken:${userStorage().getDeviceToken}");
//   Get.toNamed(AppRoutes.dashboardRoute);
// // if (UserData().getLoginUserData.roleId == 8) {
// //   Get.offNamed(Routes.DEVELOPERDASHBOARD);
// // } else if (UserData().getLoginUserData.roleId == 7) {
// //   Get.offNamed(Routes.TEAMLEADDASHBOARD);
// // } else {
// //   Get.offNamed(Routes.ADMINDASHBOARD);
// // }
// // if(UserData().getLoginUserData.roleId==7){
// //   Get.offNamed(Routes.TEAMLEADDASHBOARD);
// // }else{
// //   print("NOOOOOOOOOOOOOOOOOOOO");
// // }
//
// } else {
// ProgressDialogue().hide();
// //return print("dddddddddddd"+responseData.body.toString());
// return NetWorkExceptions.handleResponse(responseData);
// }
//   );
//
//
//
//
// }
//
// class LoginResponse {
//
//   static fromJson(param0) {}
// }
//
// class ChatDataModal {
//   static fromJson(e) {}
// }
//
// class BacklogDetails {
//   static fromJson(e) {}
// }
//
//

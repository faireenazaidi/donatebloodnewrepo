

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'app_color.dart';



// Live URL
 //String baseUrl='http://182.156.200.179:201/api/';
 //String imageUrl='http://192.168.8.2:127/assets/images/';

// Local URL
 String baseUrl='https://516f-14-97-58-74.ngrok-free.app/';
String sentenceMatchApi='http://172.16.19.195:5000/';



String secretMapKey='AIzaSyBiCc5Juc52C8oAvuqo_y2rCQh6VU_802Q';


// UserData user=UserData();


enum Data {
  fetchInProgress,
  found,
  isEmpty,
}


var cancelResponse={'responseCode': 0, 'responseMessage': 'Try Again...'};

class App {
  api(url,body,context,{
  token,
    raw,
  })
  async {
    try{
      log(baseUrl+url);
      log(body.toString());
   if(token=true){
     // print(user.getUserToken.toString());
   }
   else{
     print('Token False');
   }

      var response = (token?? false)?    await http.post(
          Uri.parse(baseUrl+url),
          headers: {
             // 'token':  user.getUserToken,
            //'token':  '0767E2E35633451098B06EB98AA030C1U-24786',
            //'userID': user.getStudentId.toString()
          },
          body: body
      ):await http.post(
          Uri.parse(baseUrl+url),
          body: body,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
   log("hereeeeeeeeeeeeeeeeeeeee"+response.body.toString());

      var  data = await json.decode(response.body);



  

      // if(data is String){
      //   if(data=='You are logged out, please login again !!' || data=='Unauthorised User'){
      //     Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
      //     await user.removeUserData();
      //     //replaceNavigate(context, LoginPageView());
      //     alertToast(context, data.toString());
      //
      //   }
      //   else{
      //     var newData={
      //       'status': 0,
      //       'message': data,
      //     };
      //     print(newData.toString());
      //     return newData;
      //   }
      //
      //  // return newData;
      // }
      // else{
      //
      //
      //   print(response.statusCode);
      //
      //
      //   if(data is Map){
      //     data['responseCode']=response.statusCode;
      //   }
      //   else if(data is List){
      //     var newData={
      //       'responseCode': response.statusCode,
      //       'data': data,
      //     };
      //     return newData;
      //   }
      //
      //
      //
      //   print(data.toString());
      //   if(data['status']==0 && (data['message']=='Invalid Token' || data['message']=='Unauthorised User') ){
      //
      //       Navigator.popUntil(context, ModalRoute.withName('/DashboardView'));
      //       await user.removeUserData();
      //       //replaceNavigate(context, LoginPageView());
      //       alertToast(context, data['message']);
      //   }
      //   else{
      //
      //     return data;
      //   }
      //
      //
      //
      // }

      // if(data is List){
      //   return data[0];
      // }
      // else{
      //   return data;
      // }

    }
    on SocketException {
      print('No Internet connection');
      var retry=await apiDialogue(context,'Alert', 'Internet connection issue, try to reconnect.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }

    }
    on TimeoutException catch (e) {
      print('Time Out '+e.toString());
      var retry=await apiDialogue(context,'Alert', 'Time Out, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    catch (e) {
      print('Error in Api: $e');
      var retry=await apiDialogue(context,'Alert', 'Some Error Occur, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
  }



  navigate(context,route) async{
    var data=await Navigator.push(context,
        PageRouteBuilder(

            pageBuilder: (BuildContext context, _, __) {
              return route;
            },
            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(
                alwaysIncludeSemantics: true,
                  opacity: animation,
                  child: child
              );
            }
        ));
    return data;
  }

  replaceNavigate(context,route,{
    String? routeName
  }) async{

    var data=await Navigator.pushReplacement(context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return route;
            },
            transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
              return FadeTransition(
                  alwaysIncludeSemantics: true,
                  opacity: animation,
                  child: child
              );
            }
        ));
    return data;
  }

  navigateTransparent(context,route) async{
    var data=await Navigator.push(context, PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return route;
        },
      transitionsBuilder: (context, a1, a2, widget) {
        return widget;
      },
      transitionDuration: const Duration(milliseconds: 200),
        )
    );
    return data;
  }










// tabletOrAndroidView(widget)
// {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       isTablet?
//       SizedBox(
//         width: 600,
//         child:   widget,)
//           :
//       Expanded(
//         child:   widget,
//       ),
//     ],
//   );
// }
//
//
// tabletOrAndroidViewHeight(h)
// {
//   return isTablet? (h+(h/3)).toDouble():h.toDouble();
// }
//
// tabletOrAndroidViewTextSize(s)
// {
//   return  isTablet? (s*2).toDouble():s.toDouble();
// }




}


// class MultiPart {
//
//   multipart(String filePath) async{
//     print(filePath);
//    return  await MultipartFile.fromFile(filePath);
//   }
//
//
//   api(url,body,context,{
//     imagePath,
//     imagePathName,
//     String? fullUrl
//   })
//   async {
//      // dio.options.contentType= Headers.formUrlEncodedContentType;
//     try{
//
//       print(imagePath.toString());
//       print(fullUrl??(baseUrl+url));
//       print(body.toString());
//       print(user.getUserToken.toString());
//       // var formData = FormData.fromMap(body);
//       // var response = await Dio().post(baseUrl+url,
//       //   data: formData,
//       //   options: (token?? false)? Options(
//       //       headers: {
//       //         'accessToken': user.getUserToken,
//       //       }):null,
//       // );
//
//
//       var headers = {
//         'accessToken': user.getUserToken.toString()
//       };
//
//       var request = http.MultipartRequest('POST', Uri.parse(fullUrl??(baseUrl+url)));
//
//       request.fields.addAll(body);
//       request.files.add(await http.MultipartFile.fromPath(imagePathName ?? 'file', imagePath.toString()));
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//
//
//       // if (response.statusCode == 200) {
//       //   print(await response.stream.bytesToString());
//       // }
//       // else {
//       //   print(response.reasonPhrase);
//       // }
//       var data={
//         'status':  response.statusCode==200? 1: 0,
//         'data': await response.stream.bytesToString(),
//       };
//       print(data.toString());
//
//         return  data;
//
//
//     }
//     on SocketException {
//       print('No Internet connection');
//       var retry=await apiDialogue(context,'Alert', 'Internet connection issue, try to reconnect.',
//       );
//       if(retry){
//         var data= await api(url,body,context,
//           imagePath: imagePath,
//           fullUrl: fullUrl
//          );
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//       // return res;
//     }
//     on TimeoutException catch (e) {
//       print('Time Out '+e.toString());
//       var retry=await apiDialogue(context,'Alert', 'Time Out, plz check your connection.',
//       );
//       if(retry){
//         var data= await api(url,body,context,
//           imagePath: imagePath,
//             fullUrl: fullUrl);
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//     }
//     catch (e) {
//       print('Error in Api: $e');
//       var retry=await apiDialogue(context,'Alert', 'Some Error Occur, plz check your connection.',
//       );
//       if(retry){
//         var data= await api(url,body,context,
//           imagePath: imagePath,
//             fullUrl: fullUrl);
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//     }
//
//   }
//
//
//   apiForSentenceMatch(url,body,context)
//   async {
//     try{
//
//       print(body.toString());
//       print(user.getUserToken.toString());
//       var headers = {
//         'accessToken': user.getUserToken.toString()
//       };
//
//       var request = http.MultipartRequest('POST', Uri.parse(sentenceMatchApi+url));
//
//       request.fields.addAll(body);
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//       var data={
//         'status':  response.statusCode==200? 1: 0,
//         'data': await response.stream.bytesToString(),
//       };
//       print(data.toString());
//
//       return  data;
//     }
//     on SocketException {
//       print('No Internet connection');
//       var retry=await apiDialogue(context,'Alert', 'Internet connection issue, try to reconnect.',
//       );
//       if(retry){
//         var data= await apiForSentenceMatch(url,body,context
//         );
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//     }
//     on TimeoutException catch (e) {
//       print('Time Out '+e.toString());
//       var retry=await apiDialogue(context,'Alert', 'Time Out, plz check your connection.',
//       );
//       if(retry){
//         var data= await apiForSentenceMatch(url,body,context);
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//     }
//     catch (e) {
//       print('Error in Api: $e');
//       var retry=await apiDialogue(context,'Alert', 'Some Error Occur, plz check your connection.',
//       );
//       if(retry){
//         var data= await apiForSentenceMatch(url,body,context);
//         return data;
//       }
//       else{
//         return cancelResponse;
//       }
//     }
//
//   }
//
//
//
//
// }









class DioData {

  // Dio dio= new  Dio(BaseOptions());


  api(url,body,context,{
    token,
    groupId,
    fileName
  })
  async {
    //   dio.options.contentType= Headers.formUrlEncodedContentType;
    try{
      print(baseUrl+url);
      // String myToken;
      String userId;
      // myToken=  user.getUserToken;
      //userId=  user.getUserLoginId;
      print(token.toString());
      // print(myToken.toString());
      //print(userId.toString());
      var formData = FormData.fromMap(body);
      var response = await Dio().post(baseUrl+url,
        data: formData,
        options: Options(
            headers: {
              // 'accessToken': myToken,
              //'userID': userId.toString()
            }),
        onSendProgress: (int sent, int total) {
          if(fileName!='')
          {
            // uploadProC.updateProgress(
            //     groupId: groupId,
            //     fileName: fileName,
            //     total: total,
            //     val: sent
            // );
          }
          // print('$sent $total');
        },
      );
     // uploadProC.removeProgress(fileName);
      var data = await jsonDecode(response.toString());
      if(data is List){
        return data;
      }
      else{
        return data;
      }
    }
    on SocketException {
      print('No Internet connection');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Internet connection issue, try to reconnect.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,
            groupId: groupId,
            fileName: fileName);
        return data;
      }
      else{
        return cancelResponse;
      }
      // return res;
    }
    on TimeoutException catch (e) {
      print('Time Out '+e.toString());
      var retry=await apiDialogue(context, 'Alert  !!!', 'Time Out, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,
            groupId: groupId,
            fileName: fileName);
        return data;
      }
      else{
        return cancelResponse;
      }
    }
    catch (e) {
      print('Error in Api: $e');
      var retry=await apiDialogue(context, 'Alert  !!!', 'Some Error Occur, plz check your connection.',
      );
      if(retry){
        var data= await api(url,body,context,
            token: token,
            groupId: groupId,
            fileName: fileName);
        return data;
      }
      else{
        return cancelResponse;
      }
    }

  }
}


apiDialogue(context,alert,msg,{
  bool? showCanCelButton
}){
  var canPressOk=true;
  var retry=false;
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return StatefulBuilder(
            builder: (context,setState)
            {
              return Transform.scale(
                scale: a1.value,
                child: Opacity(
                  opacity: a1.value,
                  child: WillPopScope(
                    onWillPop: (){
                      return Future.value(false);
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 200,
                              child: Lottie.asset('assets/noInterNet.json'),),
                            Text(msg.toString(),
                              textAlign: TextAlign.center,
                              style: MyTextTheme.mediumWCB),
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Expanded(child: SizedBox()),
                                Visibility(
                                  visible: showCanCelButton?? true,
                                  child: Expanded(
                                      flex: 2,
                                      child: MyButton(
                                        color: AppColor.greyLight,
                                          onPressed: (){
                                            if(canPressOk)
                                            {
                                              canPressOk=false;
                                              Navigator.pop(context);
                                              retry=false;
                                            }
                                          },
                                          title: 'Cancel')),
                                ),
                        Visibility(
                            visible: showCanCelButton?? true,
                                  child: Expanded(child: SizedBox()),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: MyButton(
                                        onPressed: (){
                                          if(canPressOk)
                                          {
                                            canPressOk=false;
                                            Navigator.pop(context);
                                            retry=true;
                                          }
                                        },
                                        title: 'Retry')),
                                Expanded(child: SizedBox()),
                              ],
                            )
                            // Container(
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.all(Radius.circular(0)),
                            //         border: Border.all(
                            //             color: Colors.red,
                            //             width: 2
                            //         )
                            //     ),
                            //     child: Column(
                            //       mainAxisAlignment: MainAxisAlignment.end,
                            //       children: [
                            //         Column(
                            //           children: [
                            //             Row(
                            //               children: [
                            //                 Expanded(
                            //                   child: Text(msg.toString(),
                            //                     textAlign: TextAlign.center,
                            //                     style: TextStyle(
                            //                         fontWeight: FontWeight.bold
                            //                     ),),
                            //                 ),
                            //                 TextButton(
                            //                   style: TextButton.styleFrom(
                            //                     primary: Colors.black,
                            //                     padding: EdgeInsets.all(8),
                            //                   ),
                            //                   onPressed: () {
                            //                     if(canPressOk)
                            //                     {
                            //                       canPressOk=false;
                            //                       Navigator.pop(context);
                            //                       retry=false;
                            //                     }
                            //                   },
                            //                   child: Text(
                            //                     'CANCEL',
                            //                     style: TextStyle(color: Colors.red,
                            //                         fontWeight: FontWeight.bold,
                            //                     fontSize: 12),
                            //                   ),
                            //                 ),
                            //
                            //                 TextButton(
                            //                   style: TextButton.styleFrom(
                            //                     primary: Colors.black,
                            //                     padding: EdgeInsets.all(8),
                            //                   ),
                            //                   onPressed: () {
                            //                     if(canPressOk)
                            //                     {
                            //                       canPressOk=false;
                            //                       Navigator.pop(context);
                            //                       retry=true;
                            //                     }
                            //                   },
                            //                   child: Text(
                            //                     'RETRY',
                            //                     style: TextStyle(color: Colors.red,
                            //                         fontWeight: FontWeight.bold,
                            //                         fontSize: 12),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //           ],
                            //         ),
                            //       ],
                            //     )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      }).then((val){
    canPressOk=false;
    return retry;
  });
}


















// class DioData {
//
//   Dio dio= new  Dio(BaseOptions(
//     baseUrl: baseUrl,
//     connectTimeout: 5000,
//     receiveTimeout: 3000,));
//
//
//   api(url,body,context) async{
//     dio.options.contentType= Headers.formUrlEncodedContentType;
//     // var formData = FormData.fromMap({
//     //   'userName': 'wendux',
//     //   'age': 25,
//     //   'file': await MultipartFile.fromFile('./text.txt',filename: 'upload.txt')
//     // });
//     try {
//       print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'+url.toString());
//       print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'+body.toString());
//       var response = await dio.post(url,
//           data: body,
//           options: Options(
//               headers: {
//                 HttpHeaders.contentTypeHeader: "application/json",
//               }
//               ),
//               );
//       print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'+response.toString());
//     } catch (e) {
//       print(e);
//     }
//
//   }
// }
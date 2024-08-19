
import 'package:donationdiversity/Widgets/userStorage.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:http/http.dart'as http;

class DemandFormController extends GetxController {

 UserStorage userStorage = UserStorage();

 @override
 void onInit() {
  fetchItems();
  super.onInit();
 }


 List itemToSearch=[];
 List get getItemSearch => itemToSearch;
 set updateItemList(List val )
 {
  itemToSearch=val;
  update();
 }



 void fetchItems() async {
  var headers = {
   'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('https://d0c8-14-97-58-74.ngrok-free.app/API/demand/getItemList'));
  request.body = json.encode({
   "id": userStorage.getUserId.toString(),
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
   var i = await response.stream.bytesToString();
   var tt=jsonDecode(i);
   var f = tt['responseValue']['itemList'];
   print("tttttttt$tt");
   print("tttttttt$f");
   updateItemList = f;
   print(getItemSearch.toString());
  }
  else {
   print(response.reasonPhrase);
  }
 }
}

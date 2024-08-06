import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  final List<String> imageUrls=[
"https://media.istockphoto.com/id/1283712032/photo/cardboard-box-filled-with-non-perishable-foods-on-wooden-table-high-angle-view.webp?b=1&s=170667a&w=0&k=20&c=kUpyDw-ezn1THodt6Da6CRL1yicfGV7Yv6pAQHh8ZAw=",
"https://media.istockphoto.com/id/1396160859/photo/baby-and-child-clothes-toys-in-box-second-hand-apparel-idea-circular-fashion-donation-charity.webp?b=1&s=170667a&w=0&k=20&c=S5EA0TWjsGw1d-6BY3e5blMP1W5TP8uBxCeKD9nEzE4=",
"https://media.istockphoto.com/id/1476738412/photo/close-up-digital-golden-coin-and-donate-icon-appear-on-smart-mobile-phone-on-donation.webp?b=1&s=170667a&w=0&k=20&c=0tF0vP6HeR6QJ1eVnkvJansDZMSH7X9ViIy2MC-4xZk=",
    "https://media.istockphoto.com/id/996438996/photo/different-school-supplies-in-a-cardboard-box.webp?b=1&s=170667a&w=0&k=20&c=c4PagcVphgX1a8XuNy6tpOXEkwR34psabetzcegt4P0="
];

  final PageController  pageController = PageController();
List category=[
    {
      "id":"0",
      'name':"Money",
      "member":"150",
      "image":"assets/Money.png"
  },
    {
      "id":"1",
      'name':"Grocery",
      "member":"200",
      "image":"assets/Grocery.png"
  },
  {
    "id":"2",
    'name':"Clothes",
    "member":"50",
    "image":"assets/Clothes.png"
  },
  {
    "id":"3",
    'name':"Books",
    "member":"89",
    "image":"assets/Books.png"
  }
];

  Future<bool> onExit() async {
    final shouldExit = await showDialog<bool>(
      context: Get.context!,
      builder: (context) =>
          AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you really want to exit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () =>  SystemNavigator.pop(),
            child: Text('Yes'),

          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }

  }




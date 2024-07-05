
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'category_Controller.dart';

class CategoryView extends GetView<CategoryController> {
  final CategoryController categoryController  = Get.put(CategoryController());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(
         leading: InkWell(
           onTap: (){
             Get.back();
           },
             child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
         title: Align(
           alignment: Alignment.center,
             child: Text("Books",style: TextStyle(color: Colors.white),)),
         backgroundColor: Colors.black,
         actions: const [
           Padding(
             padding: EdgeInsets.all(8.0),
             child: CircleAvatar(
               backgroundImage: NetworkImage("https://media.istockphoto.com/id/1329526325/photo/happy-millennial-student-girl-posing-in-office-open-space.webp?b=1&s=170667a&w=0&k=20&c=FHnoGUMGg3HPN0MRvyRfRQt3kkQhjcq76xdULb3FiE4="),
     
             ),
           ),
         ],
       ),
       body: ListView.builder(itemCount: categoryController.books.length,
         shrinkWrap: true,
         itemBuilder: (context, index) {
         return Card(
           margin: EdgeInsets.symmetric(vertical: 8.0),
           child: ListTile(
             leading: Image.network(categoryController.books[index]['imageUrl'].toString()),
             title: Text(categoryController.books[index]["title"].toString()),
             subtitle: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: [
                     Icon(Icons.person_outline_outlined),
                     Text(categoryController.books[index]["author"].toString()),

                   ],
                 ),
                 Row(
                   children: [
                     Icon(Icons.location_on_outlined),
                     Text(categoryController.books[index]["location"].toString()),
                   ],
                 ),
               ],
             ),
           ),
         );
       },)
     ),
   );
  }}
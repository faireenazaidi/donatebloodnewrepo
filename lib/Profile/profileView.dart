import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../Dashboard/dashboard.view.dart';

class ProfileView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading:  InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new)
        ),
        backgroundColor: Colors.white,
        title: Text("Donor"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),

              ),
            ],
          ),
          SizedBox(height: 10,),
          Text("Faireena Zaidi",style: MyTextTheme.largeCustomBCB),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email,color: Colors.red[900],size: 20,),
              Text("faireenazaidi@gmail.com"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            elevation: 5,
            child: Container(
              // margin: EdgeInsets.all(16.0),
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
             child: Padding(
               padding: const EdgeInsets.only(left: 20.0,top: 10),
               child: Column(
                 children: [
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Text("Personal Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text("First Name",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                       SizedBox(width:150,),
                       Text("Last Name",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("Faireena ",style: TextStyle(color: AppColor.black,fontSize: 15),),
                       SizedBox(width:160,),
                       Text("Zaidi",style: TextStyle(color: AppColor.black,fontSize: 15),)
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children: [
                       Text("Contact",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                       SizedBox(width:190,),
                       Text("DOB",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("8173822136 ",style: TextStyle(color: AppColor.black,fontSize: 15),),
                       SizedBox(width:100,),
                       Text("12-09-2003",style: TextStyle(color: AppColor.black,fontSize: 15),)
                     ],
                   ),
                   SizedBox(height: 10,),


                   Divider(
                     thickness: 1,
                     endIndent: 10,
                   ),
                   Row(
                     children: [
                       Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                     ],
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Text("Area",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                       SizedBox(width:200,),
                       Text("City",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("Sarfarazganj",style: TextStyle(color: AppColor.black,fontSize: 15),),
                       SizedBox(width:120,),
                       Text("Lucknow",style: TextStyle(color: AppColor.black,fontSize: 15),)
                     ],
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Row(
                     children: [
                       Text("Country",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                       SizedBox(width:170,),
                       Text("PIN Code",style: TextStyle(color: AppColor.greyColor,fontSize: 12),),
                     ],
                   ),
                   Row(
                     children: [
                       Text("India",style: TextStyle(color: AppColor.black,fontSize: 15),),
                       SizedBox(width:180,),
                       Text("226003",style: TextStyle(color: AppColor.black,fontSize: 15),)
                     ],
                   )
                 ],

               ),
             ),
              ),
               )

        ],
      ),


    );

  }
}



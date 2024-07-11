import 'package:donationdiversity/Widgets/app_color.dart';
import 'package:donationdiversity/Widgets/myButton.dart';
import 'package:donationdiversity/Widgets/primary_text_field.dart';
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'changePassController.dart';

class ChangePassView extends GetView<ChangePassController>{
  const ChangePassView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
appBar: AppBar(
  leading: InkWell(
    onTap: (){
      Get.back();
    },
    child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
  title: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text("Change Password",style: TextStyle(color: Colors.white),),
  ),
    backgroundColor: Colors.black,
),

    body: Padding(
    padding:  EdgeInsets.all(16.0),
    child: Column(
      children: [
        PrimaryTextField(
          hintText: "Old Password",
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          hintText: "New Password",
        ),
        SizedBox(
          height: 10,
        ),
        PrimaryTextField(
          hintText: "Confirm Password",
        ),
        SizedBox(
          height: 15,
        ),
        MyButton(
            onPressed: (){},
            title: "Save",
        color: AppColor.buttonColor,
        ),

      ],



    ),
      ),

    );
    }
    }





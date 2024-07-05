import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
class ListItemWidget extends StatelessWidget{
  final IconData icon;
  final String label;
  const ListItemWidget(
      {super.key,

        required this.label,
        required this.icon,
      }
      );
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 100, // Adjust the width as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 45,
              width: 45,
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white70,
                          spreadRadius: -5.0,
                          blurRadius: 20.0,
                        ),
                      ],
                color: Colors.white,
              borderRadius: BorderRadius.circular(12)
                        ),
                  child: Icon(icon, size: 30.0,color:AppColor.buttonColor,)
              ),
            ),
          const  SizedBox(height: 8.0),
            Text(label, textAlign:TextAlign.center,
                style:TextStyle(color:AppColor.buttonColor)),
          ],
        ),
      ),
    );
  }
}
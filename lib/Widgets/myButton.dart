 import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Icon? suffixIcon;
  final EdgeInsetsGeometry? padding;
  final bool expanded;
  final double? width;
  final Color? titleColor;
  final String? title;
  final Icon? prefixIcon;
  final Function onPressed;
  final Color? borderColor;
  final Color? color;
  final double? elevation;
  final double? borderRadius;
  final double? height;

  const MyButton({super.key,
    this.elevation,
    this.color,
    this.borderColor,
    required this.onPressed,
    this.prefixIcon,
    required this.title,
    this.titleColor,
    this.width,
    this.height,
    this.expanded=true,
    this.borderRadius,
    this.padding, this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          elevation: elevation??0,
          backgroundColor: color??Colors.blue,
          padding: padding??  const EdgeInsets.all(10),
          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius??0)),
              side: BorderSide(color: borderColor??color??Colors.blue)
          ),
        ),
        onPressed: (){
          onPressed();
        },
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            prefixIcon==null?Container():Padding(
              padding: const EdgeInsets.fromLTRB(0,0,5,0,),
              child: prefixIcon,
            ),
            Text(title.toString(),
              style: MyTextTheme.mediumWCN.copyWith(
                  fontSize: 16,
                  color: titleColor
              ),),
            suffixIcon==null?Container():Padding(
              padding: const EdgeInsets.fromLTRB(5,0,0,0,),
              child: suffixIcon,
            ),
          ],
        ),
      ),
    );
  }
}

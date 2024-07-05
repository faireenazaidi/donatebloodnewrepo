
import 'package:donationdiversity/Widgets/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Primarytext.dart';
import 'app_color.dart';




class PrimaryTextField extends StatelessWidget {

  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final int? maxLength;
  final bool? enabled;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final ValueChanged? onChanged;
  final Color? borderColor;
  final String? labelText;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final InputBorder? border;
  final TextStyle? style;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  // final bool? obscureText;


  const PrimaryTextField({super.key, this.hintText, this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.enabled,
    this.textAlign,
    this.keyboardType,
    this.decoration,
    this.onChanged,
    this.borderColor,
    this.maxLine,
    this.labelText,
    this.backgroundColor,
    this.hintTextColor,
    this.border,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.style,
    this.inputFormatters,
    // this.obscureText,


  });

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        inputFormatters: inputFormatters,
          cursorColor: Colors.black,
          enabled: enabled??true,
          controller: controller,
          textInputAction: TextInputAction.done,
          //  style: const TextStyle(color: Colors.white),
          minLines: maxLine,
          maxLines: maxLine==null? 1:100,
          maxLength: maxLength,
          textAlign: textAlign?? TextAlign.start,
          keyboardType: keyboardType,
          onChanged: onChanged==null? null:(val){
            onChanged!(val);
          },
          // style:  MyTextTheme().mediumBCN,
          decoration: decoration??InputDecoration(
            constraints: BoxConstraints(
              maxHeight: 60,
              minHeight: 40
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            // fillColor: (enabled??true)?
            // backgroundColor??
            //     PrimaryTextFieldUtil.fillColor:Colors.grey.shade200,
            counterText: '',
            //contentPadding: isPasswordField==null? EdgeInsets.all(5):isPasswordField? EdgeInsets.fromLTRB(5,5,5,5):EdgeInsets.all(5),
            contentPadding:  const EdgeInsets.all(12),
            hintText: hintText,
            hintStyle: MyTextTheme.mediumPCN.copyWith(
                color:hintTextColor?? AppColor.greyDark,
              fontSize: 14,
            ),
            labelText: labelText,
            labelStyle: MyTextTheme.smallPCB,
            errorStyle: MyTextTheme.mediumBCN.copyWith(
                color: AppColor.error,
              fontSize: 14,
            ),

            suffixIconConstraints: suffixIconConstraints??const BoxConstraints(
                maxHeight: 30,
                minHeight: 20,
                maxWidth: 40,
                minWidth: 40
            ),
            prefixIconConstraints:prefixIconConstraints?? const BoxConstraints(
                maxHeight: 30,
                minHeight: 20,
                maxWidth: 40,
                minWidth: 40
            ),
            prefixIcon: prefixIcon,
            suffixIcon:  suffixIcon,

            focusedBorder:  border??OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
              borderSide: BorderSide(
                  color: borderColor??PrimaryTextFieldUtil.borderColor,
                  width: 1
              ),
            ),
            enabledBorder:  border?? OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
              borderSide: BorderSide(
                  color: borderColor??PrimaryTextFieldUtil.borderColor,
                  width: 1
              ),
             ),
            disabledBorder:  border?? OutlineInputBorder(
               borderRadius: const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
              borderSide: BorderSide(
                  color: borderColor??PrimaryTextFieldUtil.borderColor,
                   width: 1
               ),
             ),
             errorBorder:   border?? OutlineInputBorder(
               borderRadius: const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
              borderSide: BorderSide(
                  color: borderColor??PrimaryTextFieldUtil.borderColor,
                  width: 1
             ),
             ),
             focusedErrorBorder:  OutlineInputBorder(
               borderRadius: const BorderRadius.all(Radius.circular(PrimaryTextFieldUtil.border)),
               borderSide: BorderSide(
                   color: borderColor??PrimaryTextFieldUtil.borderColor,
                  width: 1
              ),
             ),
          ),
          validator: validator
      );
  }
}








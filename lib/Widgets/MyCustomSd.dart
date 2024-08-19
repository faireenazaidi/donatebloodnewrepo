import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';

class MyCustomSd extends StatefulWidget {
  final List listToSearch;
  final String? label;
  final String valFrom;
  final Function onChanged;
  final String? hintText;

  const MyCustomSd({super.key, required this.listToSearch,
    required this.onChanged,
    this.label,
    this.hintText,
    required this.valFrom,});


  @override
  State<MyCustomSd> createState() => _MyCustomSdState();
}

class _MyCustomSdState extends State<MyCustomSd> {
  @override
  Widget build(BuildContext context) {
    return  CustomSearchableDropDown(
      dropdownHintText: widget.hintText??"Select Value",
      showLabelInMenu: true,
      primaryColor: Colors.red,
      menuMode: true,
      labelStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
      items: widget.listToSearch,
      label: widget.label,
      prefixIcon:  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Icon(Icons.search),
      ),
      dropDownMenuItems: widget.listToSearch.map((item) {
        return item[widget.valFrom];
      }).toList() ??
          [],
      onChanged: (value){
        widget.onChanged(value);
      },
    );
  }
}

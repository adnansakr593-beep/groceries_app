import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   CustomTextField
  (
    {
      super.key, 
      required this.label , 
      required this.hintText,
      this.obscureText= false,
      this.iconButton,

      this.onSaved
      
    }
  );

  final String label ;
  final String hintText ;
  bool obscureText ;
  final IconButton? iconButton;

  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      onSaved:onSaved ,
      
      obscureText:obscureText ,
      decoration: InputDecoration(
        suffixIcon: iconButton,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: label,
        labelStyle: TextStyle(fontFamily: fontFamilyName, color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontFamily: fontFamilyName),
        focusColor: Colors.grey,
      ),
    );
  }
}

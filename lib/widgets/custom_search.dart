import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';

// ignore: must_be_immutable
class CustomSearch extends StatelessWidget {
  CustomSearch({
    super.key,
    required this.label,
    required this.hintText,
    this.iconButton,

    this.onSaved,

    this.child,
  });

  final String label;
  final String hintText;
  final IconButton? iconButton;
  final Widget? child;

  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  25),
          child: TextFormField(
            onSaved: onSaved,
          
            decoration: InputDecoration(
              prefixIcon: iconButton,
              // suffixIcon: iconButton,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              labelText: label,
              labelStyle: TextStyle(
                fontFamily: fontFamilyName,
                color: Colors.black,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: fontFamilyName,
              ),
              focusColor: Colors.grey,
            ),
          ),
        ),

        ?child,
      ],
    );
  }
}

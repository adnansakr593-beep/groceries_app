import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';

// ignore: must_be_immutable
class CustomRowSheet extends StatefulWidget {
  CustomRowSheet({super.key, this.text1, this.text2,this.icon});

  String? text1;
  String? text2;
  final Icon? icon;

  @override
  State<CustomRowSheet> createState() => _CustomRowSheetState();
}

class _CustomRowSheetState extends State<CustomRowSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          ?widget.icon,
          
          Text(
            widget.text1 ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: fontFamilyName,
              color: Color(0xff7C7C7C),
            ),
          ),

          const SizedBox(width: 75),

          Text(
            widget.text2 ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: fontFamilyName,
              color: Color(0xff181725),
            ),
          ),

          Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff181725)),
        ],
      ),
    );
  }
}

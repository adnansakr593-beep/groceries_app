import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/helper/const.dart';

class CustomRowAccount extends StatelessWidget {
  final String? text;
  final String? svgPath;      // للـ SVG
  final IconData? iconData;   // لو عايز تمرّر Icon

  const CustomRowAccount({
    super.key,
    this.text,
    this.svgPath,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [

          if (iconData != null)
            Icon(iconData, size: 28, color: Colors.black)
          else if (svgPath != null)
            SvgPicture.asset(
              svgPath!,
              width: 28,
              height: 28,
            ),

          const SizedBox(width: 15),


          Expanded(
            child: Text(
              text ?? '',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamilyName,
                color: Color(0xff181725),
              ),
            ),
          ),

          Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff181725)),
        ],
      ),
    );
  }
}

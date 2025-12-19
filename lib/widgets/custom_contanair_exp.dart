import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';

class CustomContanairExp extends StatelessWidget {
  const CustomContanairExp({
    super.key,
    required this.color,
    required this.imagepath,
    required this.itemName,
 
  });

  final Color color;
  final String imagepath;
  final String itemName;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 189.10609436035156,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color,
      ),
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagepath, height: 100),
          const SizedBox(height: 15),
          Center(
            
              child: Text(
                textAlign: TextAlign.center,
                itemName,
                style: TextStyle(
                  
                  color: const Color(0xff181725),
                  fontFamily: fontFamilyName,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}

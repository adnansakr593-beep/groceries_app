import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:groceries_app/helper/const.dart';

// ignore: must_be_immutable
class CustomNavButton extends StatelessWidget {
  void Function(int)? onTabChange;
   CustomNavButton({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Color(0xffFCFCFC),
      padding: EdgeInsets.symmetric(vertical: 24),
      child: GNav
      (
        gap: 10,
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Color(0xffFCFCFC),
        activeColor: primAppColor,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        tabs: 
        [
          GButton
          (
            icon: Icons.home,
            text: ' Home',
            iconColor:Color(0xff181725) ,
          ),
      
          GButton
          (
            icon: Icons.shopping_bag_rounded,
            text: ' Cart',
            iconColor:Color(0xff181725) ,
          ),

          GButton
          (
            icon: Icons.manage_search_rounded,
            text: ' Explore',
            iconColor:Color(0xff181725) ,
          ),

          GButton
          (
            icon: Icons.person_outline,
            text: ' Account',
            iconColor:Color(0xff181725) ,
          ),
        ]
      ),
    );
  }
}

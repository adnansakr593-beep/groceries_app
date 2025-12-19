import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.backgroundColor,
    this.icon,
    this.child,
    this.textcolor
  });

  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Icon? icon;
  final Widget? child;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: backgroundColor,
        ),

      
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),

        child: Center(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ?icon,
              const SizedBox(width: 15,),
              Text(
                text,
                style:  TextStyle(
                  fontSize: 18,
                  color: textcolor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gilroy',
                ),
              ),

              const SizedBox(width: 25,),
              ?child
            ],
          ),
        ),
      ),
    );
  }
}

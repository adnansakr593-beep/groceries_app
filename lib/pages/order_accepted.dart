import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/main_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({super.key});

  static String id = 'order accepted';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close_outlined, color: Color(0xff181725)),
            ),

            const SizedBox(height: 35,),
        
            Center(
              child: Image.asset(
                'assets/images/accepted.png',
                height: 221.8463134765625,
                width: 222.3528289794922,
              ),
            ),
        
            Center(
              child: Text(
                'Your Order has been\n          accepted',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: fontFamilyName,
                  color: Color(0xff181725),
                ),
              ),
            ),
        
            const SizedBox(height: 25),
        
            Center(
              child: Text(
                'Your items has been placcd and is on \n it’s way to being processed',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: fontFamilyName,
                  color: Color(0xff7C7C7C),
                ),
              ),
            ),
        
            const SizedBox(height:115),
        
            CustomButton(text: 'Track Order', backgroundColor: primAppColor),
        
            
        
            CustomButton(
              text: 'Back to home',
              textcolor: Colors.black,
              backgroundColor: appbackgroundColor,
              onPressed: () {
                BlocProvider.of<CartCubit>(context).cart = [];

                Navigator.pushNamed(context, MainPage.id);
                
              },
            ),
          ],
        ),
      ),
    );
  }
}

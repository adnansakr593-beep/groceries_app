import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/widgets/custom_button.dart';

// class CustomColumnCheckout extends StatelessWidget {
//   const CustomColumnCheckout({super.key});

//   @override
//   Widget build(BuildContext context) {


class CheckoutFailedDialog extends StatelessWidget {
  const CheckoutFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/failed.png', height: 130),

            const SizedBox(height: 15),

            Text(
              'Oops! Order Failed',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Something went terribly wrong.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 25),

            CustomButton(
              text: 'Try Again',
              backgroundColor: primAppColor,
              onPressed: () {},
            ),

            const SizedBox(height: 10),

            CustomButton(
              text: 'Close',
              backgroundColor: appbackgroundColor,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

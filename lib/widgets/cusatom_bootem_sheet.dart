import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:groceries_app/cubits/checkout_cubit/checkout_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/order_accepted.dart';
import 'package:groceries_app/widgets/custom_button.dart';
import 'package:groceries_app/widgets/custom_column_checkout.dart';
import 'package:groceries_app/widgets/custom_row_sheet.dart';

class CustomBottemSheet extends StatelessWidget {
  const CustomBottemSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is CheckoutSuccsseful) {
          Navigator.pop(context);
          Navigator.pushNamed(context, OrderAccepted.id);
        }
        if (state is CheckoutFaluier) {
          Navigator.pop(context);

          showDialog(
            context: context,
            builder: (_) => const CheckoutFailedDialog(),
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: fontFamilyName,
                    ),
                  ),

                  const SizedBox(width: 25),

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close_outlined, color: Color(0xff181725)),
                  ),
                ],
              ),

              Divider(height: 1, thickness: 1),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomRowSheet(
                  text1: 'Delivery',
                  text2: 'Select Method',
                ),
              ),

              const Divider(height: 1, thickness: 1, endIndent: 15, indent: 15),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomRowSheet(
                  text1: 'Pament',
                  text2: 'Cash on delivery',
                ),
              ),

              const Divider(height: 2, thickness: 1, endIndent: 15, indent: 15),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomRowSheet(
                  text1: 'Promo Code',
                  text2: 'Pick discount',
                ),
              ),

              const Divider(height: 2, thickness: 1, endIndent: 15, indent: 15),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomRowSheet(
                  text1: 'Total Cost',
                  text2:
                      "\$ ${BlocProvider.of<CartCubit>(context).totalCartPrice()}",
                ),
              ),

              const Divider(height: 2, thickness: 1, endIndent: 15, indent: 15),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    Text(
                      'By placing an order you agree to our',
                      style: TextStyle(
                        color: Color(0xff7C7C7C),
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),

                    //const SizedBox(width: 55,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms ',
                          style: TextStyle(
                            color: primAppColor,
                            fontFamily: fontFamilyName,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        Text(
                          'And',
                          style: TextStyle(
                            color: Color(0xff7C7C7C),
                            fontFamily: fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),

                        Text(
                          ' Conditions',
                          style: TextStyle(
                            color: primAppColor,
                            fontFamily: fontFamilyName,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              CustomButton(
                text: state is CheckoutLoading ? 'Loading…' : 'Place Order',
                backgroundColor: primAppColor,
                onPressed: state is CheckoutLoading
                    ? null
                    : () => context.read<CheckoutCubit>().orderAccepted(),
              ),

              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }
}

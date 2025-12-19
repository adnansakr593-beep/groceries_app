import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/cubits/cart/cart_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/widgets/custom_grid_explore.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({super.key});

  static String id = 'DrinkPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbackgroundColor,
        centerTitle: true,
        title: Column(
          children: [
            const SizedBox(height: 15,),
            Text(
              'Drinks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: fontFamilyName,
                color: Color(0xff181725),
              ),
            ),

            
          ],
        ),
      ),
      backgroundColor: appbackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cartItems = context.read<CartCubit>().drinks; // جلب الليست من Cubit

              if (cartItems.isEmpty) {
                return const Center(
                  child: Text(
                    "The List is empty",
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              return CustomGridExplore(items: cartItems);
            },
          ),
        ),
      ),
    );
  }
}

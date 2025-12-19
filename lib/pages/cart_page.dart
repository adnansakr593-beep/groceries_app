import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/cubits/cart/cart_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/widgets/cusatom_bootem_sheet.dart';
import 'package:groceries_app/widgets/custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      appBar: AppBar(
        backgroundColor: appbackgroundColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontFamily: fontFamilyName,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xff181725),
          ),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cart = BlocProvider.of<CartCubit>(context).cart;

          if (cart.isEmpty) {
            const Divider(thickness: 2, height: 2);
            return Center(
              child: Text(
                'Cart is empty',
                style: TextStyle(
                  fontFamily: fontFamilyName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 16,
                    top: 5,
                  ),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.only(
                    right: 12,
                    left: 12,
                    bottom: 12,
                  
                  ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            item.item.imagePath,
                            width: 75,
                            height: 75,
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.item.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontFamilyName,
                                  ),
                                ),
                                Text(
                                  item.item.unit,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: fontFamilyName,
                                  ),
                                ),
                                Text(
                                  "\$${item.item.price}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: fontFamilyName,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<CartCubit>(
                                    context,
                                  ).cartDelelte(item.item);
                                },
                                icon: Icon(Icons.close),
                              ),
                              const SizedBox(height: 35),

                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<CartCubit>(
                                        context,
                                      ).deleteOneItem(item.item);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: primAppColor,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: primAppColor,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      item.quantity.toString(),
                                      style: TextStyle(
                                        fontFamily: fontFamilyName,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primAppColor,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<CartCubit>(
                                        context,
                                      ).addOneItem(item.item);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: primAppColor,
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Go to Check out',
                        backgroundColor: primAppColor,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: appbackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),

                            context: (context),
                            builder: (context) {
                              return CustomBottemSheet();
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFEFF9EF),
                          ),
                          child: Text(
                            "\$${BlocProvider.of<CartCubit>(context).totalCartPrice()}",
                            style: TextStyle(
                              fontFamily: fontFamilyName,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

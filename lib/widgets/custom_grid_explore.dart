import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/models/item_model.dart';
import 'package:groceries_app/pages/details_page.dart';

class CustomGridExplore extends StatelessWidget {
  final List<ItemModel> items;

  const CustomGridExplore({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(


      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: items.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
      ),

      itemBuilder: (context, index) {
        final item = items[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailsPage(item: item)),
            );
          },

          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Center(child: Image.asset(item.imagePath, height: 100)),

                const SizedBox(height: 10),

                Text(
                  item.name,
                  style: TextStyle(
                    color: const Color(0xff181725),
                    fontFamily: fontFamilyName,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                Text(
                  item.unit,
                  style: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontFamily: fontFamilyName,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price}',
                      style: TextStyle(
                        color: const Color(0xff181725),
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),

                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: primAppColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(
                            context,
                          ).additemtocart(item, 1);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added successfully to cart'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

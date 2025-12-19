import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/models/item_model.dart';
import 'package:groceries_app/widgets/custom_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.item});
  static String id = 'Details Page';
  final ItemModel item;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      // ignore: deprecated_member_use
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Image.asset(widget.item.imagePath),
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  widget.item.name,
                  style: TextStyle(
                    color: const Color(0xff181725),
                    fontFamily: fontFamilyName,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  widget.item.unit,
                  style: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontFamily: fontFamilyName,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.item.price}',
                      style: TextStyle(
                        color: const Color(0xff181725),
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              removeItem();
                            });
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
                            border: Border.all(color: primAppColor, width: 2),
                          ),
                          child: Text(
                            "$itemCount",
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
                            setState(() {
                              addItem();
                            });
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: primAppColor,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                const Divider(thickness: 2, height: 2),

                const SizedBox(height: 15),

                Text(
                  'Product Detail',
                  style: TextStyle(
                    color: const Color(0xff181725),
                    fontFamily: fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  widget.item.descreption,
                  style: TextStyle(
                    color: const Color(0xff7C7C7C),
                    fontFamily: fontFamilyName,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 15),

                const Divider(thickness: 2, height: 2),

                const SizedBox(height: 55),

                CustomButton(
                  text: 'Add To Basket',
                  backgroundColor: primAppColor,
                  onPressed: () {
                    BlocProvider.of<CartCubit>(
                      context,
                    ).additemtocart(widget.item, itemCount);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added successfully to cart')),
                    );

                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int itemCount = 0;

  int addItem() {
    return itemCount += 1;
  }

  int removeItem() => itemCount = (itemCount > 0) ? itemCount - 1 : 0;
}

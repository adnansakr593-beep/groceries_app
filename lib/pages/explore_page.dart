import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/drink_page.dart';
import 'package:groceries_app/pages/fresh_fruits_and_vegetable_page.dart';

import 'package:groceries_app/widgets/custom_contanair_exp.dart';
import 'package:groceries_app/widgets/custom_search.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: CustomSearch(
              label: 'Search Store',
              hintText: '',
              iconButton: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 28,
              ),
            
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, FreshFruitsAndVeg.id),
                          child: CustomContanairExp(
                            color: const Color(0xFFEFF9EF),
                            imagepath: "assets/images/Frash Fruits Vegetable.png",
                            itemName: "Fresh Fruits\n& Vegetable",
                          
                          ),
                        ),

                        const SizedBox(height: 25),

                        
                        CustomContanairExp(
                          
                          color: const Color(0xFFF5EDFF),
                          imagepath: "assets/images/bakery.png",
                          itemName: "Bakery & Snacks",
                        ),
                        
            
                        const SizedBox(height: 25),
                        CustomContanairExp(
                         
                          color: const Color(0xFFFFEDED),
                          imagepath: "assets/images/meet.png",
                          itemName: "Meat & Fish",
                        ),
                      ],
                    ),
            
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),

                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, DrinkPage.id ),
                          child: CustomContanairExp(
                            
                            color: const Color(0xFFEAF6FF),
                            imagepath: "assets/images/drinks.png",
                            itemName: "Beverages",
                          ),
                        ),
                        
            
                        const SizedBox(height: 25),
                        CustomContanairExp(
                          
                          color: const Color(0xFFFFF9E5),
                          imagepath: "assets/images/milk.png",
                          itemName: "Dairy & Eggs",
                        ),
            
                        
                        
                        const SizedBox(height: 25),
                        CustomContanairExp(
                          
                          color: const Color(0xFFFFF3E9),
                          imagepath: "assets/images/oil.png",
                          itemName: "Cooking Oil\n& Ghee",
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

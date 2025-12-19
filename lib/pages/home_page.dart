import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/widgets/custom_grid_builder.dart';
import 'package:groceries_app/widgets/custom_search.dart';
import 'package:groceries_app/helper/const.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
        
              Center(
                child: Image.asset(
                  'assets/images/mini carrot.png',
                  height: 50,
                ),
              ),
        
              const SizedBox(height: 25),
        
              /// Search Bar
              CustomSearch(
                label: 'Search Store',
                hintText: '',
                iconButton: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 28,
                ),
              ),
        
              const SizedBox(height: 35),
        
              // Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      'assets/images/banner.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      //height: 150,
                    ),
                  ),
                ),
              ),
        
              const SizedBox(height: 25),
        
              // Section title + see all
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exclusive Offer',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primAppColor,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 15),
        
              /// Horizontal Grid
              SizedBox(
                height: 250,
                child: CustomGridBuilder(items: BlocProvider.of<CartCubit>(context).exclusiveOfferItems),
              ),
        
              const SizedBox(height: 30),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Selling ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primAppColor,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 15),
        
              SizedBox(
                height: 250,
                child: CustomGridBuilder(items: BlocProvider.of<CartCubit>(context).bestSellingItems),
              ),
        
              const SizedBox(height: 30),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Drinks',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: primAppColor,
                        fontFamily: fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 15),
        
              SizedBox(
                height: 250,
                child: CustomGridBuilder(items: BlocProvider.of<CartCubit>(context).drinks),
              ),
        
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

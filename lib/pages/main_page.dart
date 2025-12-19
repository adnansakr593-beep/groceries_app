import 'package:flutter/material.dart';
import 'package:groceries_app/pages/account_page.dart';
import 'package:groceries_app/pages/cart_page.dart';
import 'package:groceries_app/pages/explore_page.dart';

import 'package:groceries_app/pages/home_page.dart';
import 'package:groceries_app/widgets/custom_nav_button.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static String id = 'main Page';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = 
  [
    const HomePage(), 
    const CartPage(),
    const ExplorePage(),
    const AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      bottomNavigationBar: CustomNavButton(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[_selectedIndex],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/login_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  static String id = 'IntroPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// الخلفية (الصورة)
          Positioned.fill(
            child: Image.asset(
              'assets/images/man.png', // غير المسار حسب صورتك
              fit: BoxFit.cover,
            ),
          ),

          /// طبقة غامقة خفيفة فوق الصورة (اختياري)
          Positioned.fill(
            child: Container(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.2),
            ),
          ),

          /// المحتوى في الأسفل
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric
              (horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    // ignore: deprecated_member_use
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// الأيقونة
                  Image.asset(
                    'assets/images/carrot.png', // حط لوجو صغير أو SVG
                    height: 40,
                  ),

                  const SizedBox(height: 16),

                  /// العنوان
                  const Text(
                    "Welcome\nto our store",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'gilroy',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// النص
                  const Text(
                    "Get your groceries in as fast as one hour",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'gilroy',
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// الزرار
                  CustomButton
                  (
                    text: 'Get Started', 
                  
                    onPressed: ()
                    {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    backgroundColor: primAppColor,
                  ),
                  SizedBox(height: 25,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

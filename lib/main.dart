import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/cubits/checkout_cubit/checkout_cubit.dart';
import 'package:groceries_app/cubits/google_sigin/google_signin_cubit.dart';
import 'package:groceries_app/cubits/regestier_cubit/regestier_cubit.dart';
import 'package:groceries_app/cubits/sigin_cubit/sigin_cubit.dart';
import 'package:groceries_app/pages/drink_page.dart';
import 'package:groceries_app/pages/fresh_fruits_and_vegetable_page.dart';
import 'package:groceries_app/pages/intro_page.dart';
import 'package:groceries_app/pages/login_page.dart';
import 'package:groceries_app/pages/main_page.dart';
import 'package:groceries_app/pages/order_accepted.dart';
import 'package:groceries_app/pages/signUp_page.dart';
import 'package:groceries_app/pages/signin_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const GroceriesApp());
}

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GoogleSigninCubit()),
        BlocProvider(create: (context) => SiginCubit()),
        BlocProvider(create: (context) => RegestierCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
          create: (context) => CheckoutCubit(context.read<CartCubit>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          IntroPage.id: (context) => IntroPage(),
          SigninPage.id: (context) => SigninPage(),
          MainPage.id: (context) => MainPage(),
          SignupPage.id: (context) => SignupPage(),
          OrderAccepted.id: (context) => OrderAccepted(),
          FreshFruitsAndVeg.id : (context) => FreshFruitsAndVeg(),
          DrinkPage.id : (context) => DrinkPage(),
        },
        initialRoute: IntroPage.id,
      ),
    );
  }
}

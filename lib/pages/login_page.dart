import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/cubits/google_sigin/google_signin_cubit.dart';
import 'package:groceries_app/cubits/google_sigin/google_signin_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/main_page.dart';
import 'package:groceries_app/pages/signin_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 28),
                Expanded(
                  child: Image.asset
                  (
                    'assets/images/vegtabels.png',
                    fit: BoxFit.cover,
                    
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 35),
      
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Get your groceries\n with nectar',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'gilroy',
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
              ),
            ),
      
            SizedBox(height: 34),
      
            Center(
              child: CustomButton(
                text: 'Login',
                backgroundColor: primAppColor,
                onPressed: () {
                  Navigator.pushNamed(context, SigninPage.id);
                },
              ),
            ),
      
            Divider(height: 5, indent: 15, endIndent: 15, thickness: 2),
      
            SizedBox(height: 34),
            Center(
              child: Text(
                'Or connect with social media',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'gilroy',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
      
            BlocConsumer<GoogleSigninCubit, GoogleSigninState>(
              listener: (context, state) {
                if (state is GoogleSigninSuccess) {
                  Navigator.pushNamed(context, MainPage.id);
                } else if (state is GoogleSigninFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is GoogleSigninLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  text: 'Continue with Google',
                  onPressed: BlocProvider.of<GoogleSigninCubit>(
                    context,
                  ).signInWithGoogle,
                  backgroundColor: Color(0xff5383EC),
                  icon: Icon(
                    FontAwesomeIcons.google,
                    size: 30,
                    color: Colors.white,
                  ),
                );
              },
            ),
      
            CustomButton(
              text: 'Continue with Facebook',
              onPressed: null,
              backgroundColor: Color(0xff4A66AC),
              icon: Icon(
                FontAwesomeIcons.facebook,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

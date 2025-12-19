import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/google_sigin/google_signin_cubit.dart';
import 'package:groceries_app/cubits/google_sigin/google_signin_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/intro_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';
import 'package:groceries_app/widgets/custom_row_accounr.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleSigninCubit, GoogleSigninState>(
      builder: (context, state) {
        if (state is GoogleSigninSuccess) {
          final user = state.user;
          bool verified = user?.emailVerified ?? false;
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 25),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.network(
                                user?.photoURL ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  user?.displayName ?? 'no name',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontFamilyName,
                                    color: Color(0xff181725),
                                  ),
                                ),

                                const SizedBox(width: 5),

                                if (verified)
                                  Icon(Icons.verified, color: Colors.blue),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Text(
                              user?.email ?? 'no email',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: fontFamilyName,
                                color: Color(0xff7C7C7C),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Divider(height: 1, thickness: 1),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Orders',
                        svgPath: 'assets/images/Orders icon.svg',
                      ),
                    ),

                    const Divider(
                      height: 1,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'My Details',
                        svgPath: 'assets/images/My Details icon.svg',
                      ),
                    ),

                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Delivery Address',
                        svgPath: 'assets/images/Delicery address.svg',
                      ),
                    ),

                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),



                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Payment Methods',
                        
                        svgPath: 'assets/images/Payment Methods.svg',
                      ),
                    ),


                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Promo Cord',
                        svgPath: 'assets/images/Promo Cord icon.svg',
                      ),
                    ),


                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Notifecations ',
                        svgPath: 'assets/images/Bell icon.svg',
                      ),
                    ),


                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'Help',
                        svgPath: 'assets/images/help icon.svg',
                      ),
                    ),


                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CustomRowAccount(
                        text: 'About ',
                        svgPath: 'assets/images/about icon.svg',
                      ),
                    ),


                    const Divider(
                      height: 2,
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                    ),

                    CustomButton(
                      text: 'Log out',
                      backgroundColor: primAppColor,
                      onPressed: () {
                        BlocProvider.of<GoogleSigninCubit>(context).signOut();
                        Navigator.pushNamed(context, IntroPage.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Text('not loged in');
      },
    );
  }
}

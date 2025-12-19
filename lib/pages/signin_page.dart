import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/sigin_cubit/sigin_cubit.dart';
import 'package:groceries_app/cubits/sigin_cubit/sigin_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/main_page.dart';
import 'package:groceries_app/pages/signUp_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';
import 'package:groceries_app/widgets/custom_text_field.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  static String id = 'SignIn Page';

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _obscurePassword = true;
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 55),
                  Center(child: Image.asset('assets/images/mini carrot.png')),
                  const SizedBox(height: 55),
                  const Text(
                    'Login ',
                    style: TextStyle(
                      fontSize: 38,
                      fontFamily: 'gilroy',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enter your emails and password ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: fontFamilyName,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 55),

                  CustomTextField(
                    label: 'Email',
                    hintText: 'Enter your email',
                    onSaved: (value) {
                      email = value!;
                    },
                  ),

                  const SizedBox(height: 25),
                  CustomTextField(
                    label: 'Password',
                    hintText: 'Enter your password',
                    obscureText: _obscurePassword,
                    iconButton: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),

                    onSaved: (value) {
                      password = value!;
                    },
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password ?',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontFamilyName,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  BlocConsumer<SiginCubit, SiginState>(
                    listener: (context, state) {
                      if (state is SiginSucss) {
                        Navigator.pushNamed(context, MainPage.id);
                      } else if (state is SiginFaliure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errmassege)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SiginLoading) {
                        return CircularProgressIndicator();
                      }
                      return CustomButton(
                        text: 'Login',
                        backgroundColor: primAppColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            BlocProvider.of<SiginCubit>(
                              context,
                            ).firebaseauthmethod(
                              email: email,
                              password: password,
                            );
                          }
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontFamilyName,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignupPage.id);
                        },
                        child: Text(
                          ' Singup',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: fontFamilyName,
                            fontWeight: FontWeight.w400,
                            color: primAppColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

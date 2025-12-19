import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/regestier_cubit/regestier_cubit.dart';
import 'package:groceries_app/cubits/regestier_cubit/regestier_state.dart';
import 'package:groceries_app/helper/const.dart';
import 'package:groceries_app/pages/main_page.dart';
import 'package:groceries_app/pages/signin_page.dart';
import 'package:groceries_app/widgets/custom_button.dart';
import 'package:groceries_app/widgets/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String id = 'sign Up page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
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
                    'Sign up ',
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

                  BlocConsumer<RegestierCubit, RegisterStates>(
                    listener: (context, state) {
                      if (state is RegisterSucss) {
                        Navigator.pushNamed(context, MainPage.id);
                      } else if (state is RegisterFaliure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errmassege)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterWait) {
                        return CircularProgressIndicator();
                      }
                      return CustomButton(
                        text: 'Sign up',
                        backgroundColor: primAppColor,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            BlocProvider.of<RegestierCubit>(
                              context,
                            ).registerUser(
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
                        'Already have an account?  ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontFamilyName,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SigninPage.id);
                        },
                        child: Text(
                          ' Singin',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/signup_view_model.dart';
import '../widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(builder: (_, signupViewModel, __) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 70, horizontal: 80),
                      child: Image.asset('assets/images/Logo2.png'),
                    ),
                    const Heading(
                      data: 'Sign Up',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: signupViewModel.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.alternate_email,
                        ),
                        hintText: 'EMAIL ADDRESS',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextField(
                      controller: signupViewModel.nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.person,
                        ),
                        hintText: 'USER NAME',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextField(
                      controller: signupViewModel.passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.lock_outline,
                        ),
                        hintText: 'PASSWORD',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextField(
                      controller: signupViewModel.confirmPasswordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.lock_outline,
                        ),
                        hintText: 'CONFIRM PASSWORD',
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                      text: 'REGISTER',
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', ModalRoute.withName('/'));
                      },
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const Heading2(
                      data: 'OR USE:',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/connect_google.png',
                                  height: 50.h,
                                ))),
                        SizedBox(
                          width: 20.h,
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Image.asset(
                                  'assets/images/connect_facebook.png',
                                  height: 50.h,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Heading2(
                        data: 'ALREADY HAVE AN ACCOUNT?',
                      ),
                    ),

                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Heading(
                        data: 'Login >',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

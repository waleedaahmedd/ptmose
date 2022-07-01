import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/login_view_model.dart';
import '../utils/custom_font_style.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (_, loginViewModel, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 70, horizontal: 100),
                  child: Image.asset('assets/images/Logo.png'),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0))),
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Heading(
                          data: 'Login',
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: loginViewModel.nameController,
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
                              controller:
                                  loginViewModel.passwordController,
                              obscureText:
                                  loginViewModel.getShowPassword,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    loginViewModel.setShowPassword(
                                        !loginViewModel
                                            .getShowPassword);
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                                hintText: 'PASSWORD',
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/forget_password');
                                  },
                                  child: const Heading2(
                                    data: 'FORGOT PASSWORD?',
                                  ),
                                )),

                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          CustomButton(
                            text: 'SIGN IN',
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', ModalRoute.withName('/'));
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Center(
                            child: Heading2(
                              data: 'OR USE:',
                            ),
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
                            height: 10.h,
                          ),
                          CustomButton(
                            text: 'LOGIN AS GUEST',
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home', ModalRoute.withName('/'));
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Heading2(
                            data: 'NEW HERE?',
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/sign_up');
                            },
                            child: const Heading(
                              data: 'Sign Up >',
                            ),
                          ),
                        ],),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

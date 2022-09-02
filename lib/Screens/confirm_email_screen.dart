import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/auth_view_model.dart';

import '../utils/custom_font_style.dart';
import '../widget/custom_button_1.dart';

class ConfirmEmailScreen extends StatelessWidget {
  ConfirmEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (_, authViewModel, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 70, horizontal: 100),
                      child: Image.asset('assets/images/Logo.png'),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.0))),
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GoogleFontText1(
                                  data: 'Forgot Password?',
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextField(
                                  controller: authViewModel.emailController,
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
                                CustomButton1(
                                  text: 'SEND CODE',
                                  onPressed: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    authViewModel
                                        .callForgetPasswordEmail()
                                        .then((value) {
                                      if (value) {
                                        Navigator.of(context).pushNamed('/otp');
                                        EasyLoading.showSuccess(authViewModel
                                            .getForgetPasswordEmailResponse
                                            .data!
                                            .forgotPassword!
                                            .message!);
                                      } else {
                                        EasyLoading.showSuccess(authViewModel
                                            .getForgetPasswordEmailResponse
                                            .data!
                                            .forgotPassword!
                                            .message!);
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const NormalFontText4(
                                  data:
                                      'If an account with the email address provided then a code will be sent. Please click on the link to reset your password.',
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const NormalFontText1(
                                  data: 'NEW HERE?',
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/sign_up');
                                  },
                                  child: const GoogleFontText1(
                                    data: 'Sign Up >',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/custom_button_1.dart';
import '../widget/social_media_buttons_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
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
                          const GoogleFontText1(
                            data: 'Sign Up',
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextField(
                            controller: authViewModel.emailController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(
                                  Icons.alternate_email,
                                ),
                                hintText: 'EMAIL ADDRESS',
                                errorText: authViewModel
                                        .getEmailValidateMessage.isEmpty
                                    ? null
                                    : authViewModel.getEmailValidateMessage),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: authViewModel.nameController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(
                                  Icons.person,
                                ),
                                hintText: 'USER NAME',
                                errorText:
                                    authViewModel.getNameValidateMessage.isEmpty
                                        ? null
                                        : authViewModel.getNameValidateMessage),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: authViewModel.passwordController,
                            obscureText: authViewModel.getShowPassword,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    authViewModel.setShowPassword(
                                        !authViewModel.getShowPassword);
                                  },
                                  icon: const Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                                hintText: 'PASSWORD',
                                errorText: authViewModel
                                        .getPasswordValidateMessage.isEmpty
                                    ? null
                                    : authViewModel.getPasswordValidateMessage),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextField(
                            controller: authViewModel.confirmPasswordController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                suffixIcon: const Icon(
                                  Icons.lock_outline,
                                ),
                                hintText: 'CONFIRM PASSWORD',
                                errorText: authViewModel
                                        .getConfirmPasswordValidateMessage
                                        .isEmpty
                                    ? null
                                    : authViewModel
                                        .getConfirmPasswordValidateMessage),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomButton1(
                            text: 'REGISTER',
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (authViewModel.signUpValidation() == true) {
                                authViewModel.callSignUpApi().then((value) {
                                  if (value == true) {
                                    if (authViewModel
                                        .getUserDataResponse.isVerified!) {
                                      EasyLoading.showSuccess(authViewModel
                                          .getSignUpResponse
                                          .signUpData!
                                          .createUser!
                                          .message!);
                                      authViewModel.setGuestUser(false);
                                      authViewModel.callUserName();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/home',
                                              ModalRoute.withName('/'));
                                    } else {
                                      EasyLoading.showSuccess(authViewModel
                                          .getLoginResponse
                                          .loginData!
                                          .loginUser!
                                          .message!);
                                      authViewModel.setGuestUser(false);
                                      authViewModel.callUserName();
                                      Navigator.of(context).pushNamed('/otp');
                                    }
                                  } else {
                                    EasyLoading.showError(authViewModel
                                        .getSignUpResponse
                                        .signUpData!
                                        .createUser!
                                        .message!);
                                  }
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          const NormalFontText1(
                            data: 'OR USE:',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const SocialMediaButtonsWidgets(),
                          SizedBox(
                            height: 20.h,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: NormalFontText1(
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
                            child: const GoogleFontText1(
                              data: 'Login >',
                            ),
                          ),
                        ],
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

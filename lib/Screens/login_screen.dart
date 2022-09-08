import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/auth_view_model.dart';
import '../utils/shared_pref .dart';
import '../utils/custom_font_style.dart';
import '../widget/custom_button_1.dart';
import '../widget/social_media_buttons_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPref sharedPref = SharedPref();

    return Consumer<AuthViewModel>(
      builder: (_, authViewModel, __) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
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
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20.0),
                                child: GoogleFontText1(
                                  data: 'Login',
                                ),
                              ),
                              Column(
                                children: [
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
                                            : authViewModel
                                                .getEmailValidateMessage),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextField(
                                    controller:
                                        authViewModel.passwordController,
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
                                                .getPasswordValidateMessage
                                                .isEmpty
                                            ? null
                                            : authViewModel
                                                .getPasswordValidateMessage),
                                  ),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          authViewModel
                                              .setShowForgotPasswordScreen(true);
                                          Navigator.of(context)
                                              .pushNamed('/confirm_email');
                                        },
                                        child: const NormalFontText1(
                                          data: 'FORGOT PASSWORD?',
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomButton1(
                                    text: 'SIGN IN',
                                    onPressed: () {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      authViewModel
                                          .setShowForgotPasswordScreen(false);
                                      if (authViewModel.logInValidation() ==
                                          true) {
                                        authViewModel
                                            .callLoginApi()
                                            .then((value) {
                                          if (value == true) {
                                            if (authViewModel
                                                .getUserDataResponse
                                                .isVerified!) {
                                              EasyLoading.showSuccess(
                                                  authViewModel
                                                      .getLoginResponse
                                                      .loginData!
                                                      .loginUser!
                                                      .message!);
                                              authViewModel.setGuestUser(false);
                                              authViewModel.callUserName();
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      '/home',
                                                      ModalRoute.withName('/'));
                                            } else {
                                              EasyLoading.showSuccess(
                                                  authViewModel
                                                      .getLoginResponse
                                                      .loginData!
                                                      .loginUser!
                                                      .message!);
                                              authViewModel.setGuestUser(false);
                                              authViewModel.callUserName();
                                              Navigator.of(context)
                                                  .pushNamed('/otp');
                                            }
                                          } else {
                                            EasyLoading.showError(authViewModel
                                                .getLoginResponse
                                                .loginData!
                                                .loginUser!
                                                .message!);
                                          }
                                        });
                                      }

                                      /* Navigator.of(context).pushNamedAndRemoveUntil(
                                        '/home', ModalRoute.withName('/'));*/
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Center(
                                    child: NormalFontText1(
                                      data: 'OR USE:',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const SocialMediaButtonsWidgets(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomButton1(
                                    text: 'LOGIN AS GUEST',
                                    onPressed: () {
                                      authViewModel.setGuestUser(true);
                                      final prevUserData =
                                          sharedPref.read('userData');
                                      if (prevUserData != null) {
                                        sharedPref.remove('userData');
                                      }
                                      authViewModel.callUserName();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/home',
                                              ModalRoute.withName('/'));
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const NormalFontText1(
                                    data: 'NEW HERE?',
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () {
                                      authViewModel.clearValidationMessages();
                                      Navigator.of(context)
                                          .pushNamed('/sign_up');
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
              ],
            ),
          ),
        );
      },
    );
  }
}

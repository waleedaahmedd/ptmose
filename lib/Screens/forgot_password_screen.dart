import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/custom_button_1.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                                      hintText: 'NEW PASSWORD',
                                      errorText: authViewModel
                                              .getPasswordValidateMessage
                                              .isEmpty
                                          ? null
                                          : authViewModel
                                              .getPasswordValidateMessage),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                TextField(
                                  controller:
                                      authViewModel.confirmPasswordController,
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
                              ],
                            ),
                            CustomButton1(
                              text: 'SUBMIT',
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                final validation = authViewModel.resetPasswordValidation();
                                if (validation) {
                                authViewModel.callResetPassword().then((value) {
                                    if (value) {
                                      authViewModel.passwordController.clear();
                                      authViewModel.confirmPasswordController.clear();
                                      authViewModel.setGuestUser(false);
                                      authViewModel.callUserName();
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil('/home',
                                              ModalRoute.withName('/'));
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
                                    }
                              },
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

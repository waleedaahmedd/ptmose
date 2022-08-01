import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/custom_button_1.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoogleFontText5(
                data: 'SETTINGS',
              ),
              SizedBox(
                height: 20.h,
              ),
              const GoogleFontText5(
                data: 'Change Your Password',
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                controller: authViewModel.oldPasswordController,
                obscureText: authViewModel.getShowPassword,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        authViewModel
                            .setShowPassword(!authViewModel.getShowPassword);
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    hintText: 'OLD PASSWORD',
                    errorText:
                        authViewModel.getOldPasswordValidateMessage.isEmpty
                            ? null
                            : authViewModel.getOldPasswordValidateMessage),
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
                        authViewModel
                            .setShowPassword(!authViewModel.getShowPassword);
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    hintText: 'NEW PASSWORD',
                    errorText: authViewModel.getPasswordValidateMessage.isEmpty
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
                    errorText:
                        authViewModel.getConfirmPasswordValidateMessage.isEmpty
                            ? null
                            : authViewModel.getConfirmPasswordValidateMessage),
              ),
              const Spacer(),
              CustomButton1(
                text: 'SUBMIT',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (authViewModel.changePasswordValidation() == true) {
                    authViewModel.callChangePasswordApi().then((value) {
                      if (value == true) {
                        authViewModel.passwordController.clear();
                        authViewModel.emailController.text = authViewModel.getUserDataResponse.email!;
                        authViewModel.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', ModalRoute.withName('/'));
                      }
                    });
                  }
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

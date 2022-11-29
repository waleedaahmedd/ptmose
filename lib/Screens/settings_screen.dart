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
              SizedBox(
                height: 20.h,
              ),
              CustomButton1(
                text: 'SUBMIT',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (authViewModel.changePasswordValidation() == true) {
                    authViewModel.callChangePasswordApi().then((value) {
                      if (value == true) {
                        authViewModel.passwordController.clear();
                        authViewModel.emailController.text =
                            authViewModel.getUserDataResponse.email!;
                        authViewModel.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/login', ModalRoute.withName('/'));
                      }
                    });
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              const GoogleFontText5(
                data: 'Delete Your Account',
              ),
              SizedBox(
                height: 10.h,
              ),
              const NormalFontText2(
                data:
                    'If you confirm that you want to delete your account, we will process your request within 30 days.\nOnce your account is deleted, we won\'t be able to restore your data anymore. \nFrom this point onwards, you don\'t need to do anything else. Once your account is deleted, we will send you a confirmation email.',
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton1(
                text: 'DELETE NOW',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete Account'),
                      content: const Text(
                          'Do you really want to delete your account?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<AuthViewModel>(context, listen: false)
                                .signOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login', ModalRoute.withName('/'));
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

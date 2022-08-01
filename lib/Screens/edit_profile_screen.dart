import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/custom_button_1.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GoogleFontText5(
                data: 'EDIT PROFILE',
              ),
              SizedBox(
                height: 20.h,
              ),
              const GoogleFontText5(
                data: 'Change Your Name',
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
                    hintText: authViewModel.getUserName,
                    errorText:
                    authViewModel.getNameValidateMessage.isEmpty
                        ? null
                        : authViewModel.getNameValidateMessage),
              ),
              const Spacer(),
              CustomButton1(
                text: 'SUBMIT',
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (authViewModel.changeNameValidation() == true) {
                    authViewModel.callChangeNameApi().then((value) {
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

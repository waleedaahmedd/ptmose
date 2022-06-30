import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/login_view_model.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (_, loginViewModel, __) {
        return Scaffold(
          backgroundColor: CustomColors.purple,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 100),
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
                      children: [
                        const Heading(
                          data: 'Login',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: loginViewModel.nameController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    suffixIcon: Icon(
                                    Icons.person,
                                    ),
                                    hintText: 'USER NAME',
                                    // labelText: 'USER NAME',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: loginViewModel.passwordController,
                                  obscureText: loginViewModel.getShowPassword,
                                  decoration:  InputDecoration(
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                       onPressed: (){
                                         loginViewModel.setShowPassword(!loginViewModel.getShowPassword);
                                       },
                                      icon: const Icon(Icons.remove_red_eye,) ,
                                    ),
                                    hintText: 'PASSWORD',
                                    // labelText: 'USER NAME',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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

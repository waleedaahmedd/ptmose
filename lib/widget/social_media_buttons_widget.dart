import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';

class SocialMediaButtonsWidgets extends StatelessWidget {
  const SocialMediaButtonsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (_, authViewModel, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible:
                defaultTargetPlatform == TargetPlatform.android ? false : true,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    authViewModel.signInWithApple().then((value) {
                      if (value == true) {
                        EasyLoading.showSuccess(authViewModel
                            .getSocialMediaLoginResponse
                            .data!
                            .socialMediaLogin!
                            .message!);
                        authViewModel.setGuestUser(false);

                        authViewModel.callUserName();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', ModalRoute.withName('/'));
                      } else {
                        EasyLoading.showError(authViewModel
                            .getSocialMediaLoginResponse
                            .data!
                            .socialMediaLogin!
                            .message!);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/connect_apple.png',
                        height: 35.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              authViewModel.signInWithGoogle().then((value) {
                if (value == true) {
                  EasyLoading.showSuccess(authViewModel
                      .getSocialMediaLoginResponse
                      .data!
                      .socialMediaLogin!
                      .message!);
                  authViewModel.setGuestUser(false);

                  authViewModel.callUserName();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', ModalRoute.withName('/'));
                } else {
                  EasyLoading.showError(authViewModel
                      .getSocialMediaLoginResponse
                      .data!
                      .socialMediaLogin!
                      .message!);
                }
              });
            },
            child: Image.asset(
              'assets/images/connect_google.png',
              height: 50.h,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          GestureDetector(
            onTap: () {
              authViewModel.signInWithFacebook().then((value) {
                if (value == true) {
                  EasyLoading.showSuccess(authViewModel
                      .getSocialMediaLoginResponse
                      .data!
                      .socialMediaLogin!
                      .message!);
                  authViewModel.setGuestUser(false);

                  authViewModel.callUserName();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', ModalRoute.withName('/'));
                } else {
                  EasyLoading.showError(authViewModel
                      .getSocialMediaLoginResponse
                      .data!
                      .socialMediaLogin!
                      .message!);
                }
              });
            },
            child: Image.asset(
              'assets/images/connect_facebook.png',
              height: 50.h,
            ),
          ),
        ],
      );
    });
  }
}

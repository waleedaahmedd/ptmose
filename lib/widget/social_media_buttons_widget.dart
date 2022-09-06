import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';

class SocialMediaButtonsWidgets extends StatelessWidget {
  const SocialMediaButtonsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
        builder: (_, authViewModel, __)
    {
      return Row(
        children: [
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      authViewModel
                          .signInWithGoogle()
                          .then((value) {
                        if (value == true) {
                          EasyLoading.showSuccess(
                              authViewModel
                                  .getSocialMediaLoginResponse
                                  .data!
                                  .socialMediaLogin!
                                  .message!);
                          authViewModel
                              .setGuestUser(false);

                          authViewModel
                              .callUserName();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                              '/home',
                              ModalRoute
                                  .withName(
                                  '/'));
                        } else {
                          EasyLoading.showError(
                              authViewModel
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
                  ))),
          SizedBox(
            width: 20.h,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      authViewModel
                          .signInWithFacebook()
                          .then((value) {
                        if (value == true) {
                          EasyLoading.showSuccess(
                              authViewModel
                                  .getSocialMediaLoginResponse
                                  .data!
                                  .socialMediaLogin!
                                  .message!);
                          authViewModel
                              .setGuestUser(false);

                          authViewModel
                              .callUserName();
                          Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                              '/home',
                              ModalRoute
                                  .withName(
                                  '/'));
                        } else {
                          EasyLoading.showError(
                              authViewModel
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
                  ))),
        ],
      );
    });
  }
}

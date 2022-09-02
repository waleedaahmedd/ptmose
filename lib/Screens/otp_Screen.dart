import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/custom_button_1.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  Timer? countdownTimer;
  Duration myDuration = const Duration(minutes: 2);

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer!.cancel();
    super.dispose();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 2));
  }

  void restartTimer() {
    stopTimer();
    setState(() => myDuration = const Duration(minutes: 2));
    startTimer();
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(02));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

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
                              const GoogleFontText1(
                                data: 'Email Verification',
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NormalFontText8(
                                    data:
                                        'Please Enter OTP you receive at ${authViewModel.emailController.text} to Verify your Email Address',
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  PinCodeTextField(
                                    autoDisposeControllers: false,
                                    controller: authViewModel.otpController,
                                    autoDismissKeyboard: true,
                                    pinTheme: PinTheme(
                                        activeColor: CustomColors.purple,
                                        selectedColor: CustomColors.golden,
                                        inactiveColor: CustomColors.golden),
                                    appContext: context,
                                    pastedTextStyle: const TextStyle(
                                      color: CustomColors.golden,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textStyle: const TextStyle(
                                        color: CustomColors.golden),
                                    length: 6,
                                    onChanged: (value) {
                                      debugPrint("Completed");
                                    },
                                    beforeTextPaste: (text) {
                                      debugPrint("Allowing to paste $text");
                                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                      return true;
                                    },
                                    animationType: AnimationType.fade,
                                    validator: (v) {
                                      if (v!.length < 6) {
                                        return "wrong OTP";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      NormalFontText1(
                                        data:
                                            'OTP will Expired in $minutes:$seconds',
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        onPressed: () {
                                          authViewModel
                                              .callResendOtp()
                                              .then((status) {
                                            if (status) {
                                              restartTimer();
                                              EasyLoading.showSuccess(
                                                  authViewModel
                                                      .getResendOtpResponse
                                                      .data!
                                                      .resendOtp!
                                                      .message!);
                                            } else {
                                              resetTimer();
                                              EasyLoading.showSuccess(
                                                  authViewModel
                                                      .getResendOtpResponse
                                                      .data!
                                                      .resendOtp!
                                                      .message!);
                                            }
                                          });
                                        },
                                        child: const NormalFontText1(
                                          data: 'RESEND OTP',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomButton1(
                                    text: 'SUBMIT',
                                    onPressed: ()  {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      final validation =  authViewModel.otpValidation();
                                      if (validation) {
                                        authViewModel
                                            .callOtpVerification()
                                            .then((value) {
                                          if (value == true) {
                                            EasyLoading.showSuccess(
                                                authViewModel
                                                    .getOtpVerificationResponse
                                                    .data!
                                                    .verifyOtp!
                                                    .message!);
                                            if (authViewModel.getShowForgotPasswordScreen) {
                                              Navigator.of(context)
                                                  .pushNamed('/forgot_password');
                                            }
                                            else{
                                              authViewModel.setGuestUser(false);
                                              authViewModel.callUserName();
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                  '/home',
                                                  ModalRoute.withName('/'));
                                            }

                                          } else {
                                            EasyLoading.showError(authViewModel
                                                .getOtpVerificationResponse
                                                .data!
                                                .verifyOtp!
                                                .message!);
                                          }
                                        });
                                      }

                                      /* Navigator.of(context).pushNamedAndRemoveUntil(
                                        '/home', ModalRoute.withName('/'));*/
                                    },
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

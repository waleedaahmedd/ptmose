import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ptmose/models/requests/auth_request/forget_password_email_request.dart';
import 'package:ptmose/models/requests/auth_request/otp_verification_request.dart';
import 'package:ptmose/models/requests/auth_request/resend_otp_request.dart';
import 'package:ptmose/models/requests/auth_request/reset_password_request.dart';
import 'package:ptmose/models/requests/change_name_request.dart';
import 'package:ptmose/models/requests/change_password_request.dart';
import 'package:ptmose/models/responses/auth_response/forget_password_email_response.dart';
import 'package:ptmose/models/responses/auth_response/login_response.dart';
import 'package:ptmose/models/responses/auth_response/otp_verification_response.dart';
import 'package:ptmose/models/responses/auth_response/resend_otp_response.dart';
import 'package:ptmose/models/responses/auth_response/reset_password_response.dart';
import 'package:ptmose/models/responses/auth_response/social_media_login_response.dart';
import 'package:ptmose/models/responses/auth_response/user_data_response.dart';
import 'package:ptmose/models/responses/change_name_response.dart';
import 'package:ptmose/models/responses/change_password_response.dart';

import '../Service/api_service.dart';
import '../models/requests/auth_request/login_request.dart';
import '../models/requests/auth_request/sign_up_request.dart';
import '../models/requests/auth_request/social_media_login_request.dart';
import '../models/responses/auth_response/sign_up_response.dart';
import '../utils/shared_pref .dart';

class AuthViewModel with ChangeNotifier {
  RegExp regex =
      RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
          r"{0,253}[a-zA-Z0-9])?)*$");

  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String _emailValidateMessage = '';
  String _passwordValidateMessage = '';
  String _oldPasswordValidateMessage = '';
  String _nameValidateMessage = '';
  String _confirmPasswordValidateMessage = '';
  String _fcmToken = '';
  bool _showForgotPasswordScreen = false;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  LoginResponse? _loginResponse;
  SignUpResponse? _signUpResponse;
  ChangePasswordResponse? _changePasswordResponse;
  ChangeNameResponse? _changeNameResponse;
  SocialMediaLoginResponse? _socialMediaLoginResponse;
  OtpVerificationResponse? _otpVerificationResponse;
  ResendOtpResponse? _resendOtpResponse;
  ForgetPasswordEmailResponse? _forgetPasswordResponse;
  ResetPasswordResponse? _resetPasswordResponse;

  UserDataResponse? _userDataResponse;
  SharedPref sharedPref = SharedPref();
  String? _userName;
  bool _guestUser = false;

  String get getFcmToken => _fcmToken;

  bool get getShowForgotPasswordScreen => _showForgotPasswordScreen;

  String get getEmailValidateMessage => _emailValidateMessage;

  String get getPasswordValidateMessage => _passwordValidateMessage;

  String get getOldPasswordValidateMessage => _oldPasswordValidateMessage;

  String get getNameValidateMessage => _nameValidateMessage;

  String get getConfirmPasswordValidateMessage =>
      _confirmPasswordValidateMessage;

  String get getUserName => _userName!;

  bool get getGuestUser => _guestUser;

  bool _showPassword = false;

  bool get getShowPassword => _showPassword;

  LoginResponse get getLoginResponse => _loginResponse!;

  ResetPasswordResponse get getResetPasswordResponse => _resetPasswordResponse!;

  ForgetPasswordEmailResponse get getForgetPasswordEmailResponse =>
      _forgetPasswordResponse!;

  OtpVerificationResponse get getOtpVerificationResponse =>
      _otpVerificationResponse!;

  ResendOtpResponse get getResendOtpResponse => _resendOtpResponse!;

  ChangePasswordResponse get getChangePasswordResponse =>
      _changePasswordResponse!;

  ChangeNameResponse get getChangeNameResponse => _changeNameResponse!;

  SignUpResponse get getSignUpResponse => _signUpResponse!;

  SocialMediaLoginResponse get getSocialMediaLoginResponse =>
      _socialMediaLoginResponse!;

  UserDataResponse get getUserDataResponse => _userDataResponse!;

  void setFcmToken(String value) {
    _fcmToken = value;
    notifyListeners();
  }

  void setShowForgotPasswordScreen(bool value) {
    _showForgotPasswordScreen = value;
    notifyListeners();
  }

  void setConfirmPasswordValidateMessage(String value) {
    _confirmPasswordValidateMessage = value;
    notifyListeners();
  }

  void setEmailValidateMessage(String value) {
    _emailValidateMessage = value;
    notifyListeners();
  }

  void setPasswordValidateMessage(String value) {
    _passwordValidateMessage = value;
    notifyListeners();
  }

  void setOldPasswordValidateMessage(String value) {
    _oldPasswordValidateMessage = value;
    notifyListeners();
  }

  void setNameValidateMessage(String value) {
    _nameValidateMessage = value;
    notifyListeners();
  }
  clearValidationMessages(){
    setConfirmPasswordValidateMessage('');
    setEmailValidateMessage('');
    setPasswordValidateMessage('');
    setOldPasswordValidateMessage('');
    setNameValidateMessage('');
  }
  void setShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  void setUserName(String value) {
    _userName = value;
    notifyListeners();
  }

  void setGuestUser(bool value) {
    _guestUser = value;
    notifyListeners();
  }

  void setLoginResponse(LoginResponse value) {
    _loginResponse = value;
    notifyListeners();
  }

  void setResetPasswordResponse(ResetPasswordResponse value) {
    _resetPasswordResponse = value;
    notifyListeners();
  }

  void setForgetPasswordEmailResponse(ForgetPasswordEmailResponse value) {
    _forgetPasswordResponse = value;
    notifyListeners();
  }

  void setOtpVerificationResponse(OtpVerificationResponse value) {
    _otpVerificationResponse = value;
    notifyListeners();
  }

  void setResendOtpResponse(ResendOtpResponse value) {
    _resendOtpResponse = value;
    notifyListeners();
  }

  void setChangePasswordResponse(ChangePasswordResponse value) {
    _changePasswordResponse = value;
    notifyListeners();
  }

  void setChangeNameResponse(ChangeNameResponse value) {
    _changeNameResponse = value;
    notifyListeners();
  }

  void setSocialMediaLoginResponse(SocialMediaLoginResponse value) {
    _socialMediaLoginResponse = value;
    notifyListeners();
  }

  void setSignUpResponse(SignUpResponse value) {
    _signUpResponse = value;
    notifyListeners();
  }

  void setUserDataResponse(UserDataResponse value) {
    _userDataResponse = value;
    notifyListeners();
  }



  logInValidation() {
    emailController.text.isEmpty || !regex.hasMatch(emailController.text)
        ? setEmailValidateMessage('Please enter Valid Email Address')
        : setEmailValidateMessage('');

    passwordController.text.isEmpty
        ? setPasswordValidateMessage('Please Enter Password')
        : setPasswordValidateMessage('');

    if (_emailValidateMessage.isEmpty && _passwordValidateMessage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool otpValidation() {
    if (emailController.text.isEmpty && otpController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  signUpValidation() {
    emailController.text.isEmpty || !regex.hasMatch(emailController.text)
        ? setEmailValidateMessage('Please enter Valid Email Address')
        : setEmailValidateMessage('');

    nameController.text.isEmpty
        ? setNameValidateMessage('Please Enter Full Name')
        : setNameValidateMessage('');

    passwordController.text.isEmpty
        ? setPasswordValidateMessage('Please Enter Password')
        : setPasswordValidateMessage('');

    confirmPasswordController.text.isEmpty ||
            confirmPasswordController.text != passwordController.text
        ? setConfirmPasswordValidateMessage('Passwords are not matched')
        : setConfirmPasswordValidateMessage('');

    if (_emailValidateMessage.isEmpty &&
        _passwordValidateMessage.isEmpty &&
        _nameValidateMessage.isEmpty &&
        _confirmPasswordValidateMessage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  resetPasswordValidation() {
    passwordController.text.isEmpty
        ? setPasswordValidateMessage('Please Enter Password')
        : setPasswordValidateMessage('');

    confirmPasswordController.text.isEmpty ||
            confirmPasswordController.text != passwordController.text
        ? setConfirmPasswordValidateMessage('Passwords are not matched')
        : setConfirmPasswordValidateMessage('');

    if (_passwordValidateMessage.isEmpty &&
        _confirmPasswordValidateMessage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  changeNameValidation() {
    nameController.text.isEmpty
        ? setNameValidateMessage('Please Enter Full Name')
        : setNameValidateMessage('');

    if (_nameValidateMessage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  changePasswordValidation() {
    oldPasswordController.text.isEmpty
        ? setPasswordValidateMessage('Please Enter Password')
        : setPasswordValidateMessage('');

    passwordController.text.isEmpty
        ? setPasswordValidateMessage('Please Enter Password')
        : setPasswordValidateMessage('');

    confirmPasswordController.text.isEmpty ||
            confirmPasswordController.text != passwordController.text
        ? setConfirmPasswordValidateMessage('Passwords are not matched')
        : setConfirmPasswordValidateMessage('');

    if (_passwordValidateMessage.isEmpty &&
        _oldPasswordValidateMessage.isEmpty &&
        _confirmPasswordValidateMessage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> callChangePasswordApi() async {
    EasyLoading.show(status: 'Please Wait...');
    ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
        userId: _userDataResponse!.id!,
        newPassword: passwordController.text,
        currentPassword: oldPasswordController.text);
    final response =
        await changePasswordApi(changePasswordRequest: changePasswordRequest);
    if (response != null) {
      setChangePasswordResponse(response);
      if (_changePasswordResponse!.data!.changePassword!.status! == true) {
        EasyLoading.showSuccess(
            _changePasswordResponse!.data!.changePassword!.message!);
      } else {
        EasyLoading.showError(
            _changePasswordResponse!.data!.changePassword!.message!);
      }
      return _changePasswordResponse!.data!.changePassword!.status!;
    } else {
      EasyLoading.showError('Something Went Wrong');
      return _changePasswordResponse!.data!.changePassword!.status!;
    }
  }

  Future<bool> callChangeNameApi() async {
    EasyLoading.show(status: 'Please Wait...');
    ChangeNameRequest changeNameRequest = ChangeNameRequest(
        userId: _userDataResponse!.id!, name: nameController.text);
    final response = await changeNameApi(changeNameRequest: changeNameRequest);
    if (response != null) {
      setChangeNameResponse(response);
      if (_changeNameResponse!.data!.updateProfile!.status! == true) {
        EasyLoading.showSuccess(
            _changeNameResponse!.data!.updateProfile!.message!);
      } else {
        EasyLoading.showError(
            _changeNameResponse!.data!.updateProfile!.message!);
      }
      return _changeNameResponse!.data!.updateProfile!.status!;
    } else {
      EasyLoading.showError('Something Went Wrong');
      return _changeNameResponse!.data!.updateProfile!.status!;
    }
  }

  Future<bool> callLoginApi() async {
    EasyLoading.show(status: 'Please Wait...');
    await getUserToken();
    LoginRequest loginRequest = LoginRequest(
        fcmToken: getFcmToken,
        email: emailController.text,
        password: passwordController.text);
    final response = await loginApi(loginRequest);
    if (response != null) {
      setLoginResponse(response);
      if (_loginResponse!.loginData!.loginUser!.userDataResponse != null) {
        setUserDataResponse(
            _loginResponse!.loginData!.loginUser!.userDataResponse!);
        sharedPref.save(
            'userData', _loginResponse!.loginData!.loginUser!.userDataResponse);
      }

      return _loginResponse!.loginData!.loginUser!.status!;
    } else {
      return false;
    }
  }

  Future<bool> callSocialMediaLoginApi(
      {required String socialProviderId,
      required String socialEmail,
      required String socialName,
      required String socialRegistrationType}) async {
    SocialMediaLoginRequest socialMediaLoginRequest = SocialMediaLoginRequest(
      fcmToken: getFcmToken,
      email: socialEmail,
      providerId: socialProviderId,
      name: socialName,
      registrationType: socialRegistrationType,
    );
    final response = await socialMediaLoginApi(socialMediaLoginRequest);
    if (response != null) {
      setSocialMediaLoginResponse(response);
      if (_socialMediaLoginResponse!.data!.socialMediaLogin!.data != null) {
        setUserDataResponse(
            _socialMediaLoginResponse!.data!.socialMediaLogin!.data!);
        sharedPref.save('userData',
            _socialMediaLoginResponse!.data!.socialMediaLogin!.data);
      }
      return _socialMediaLoginResponse!.data!.socialMediaLogin!.status!;
    } else {
      return false;
    }
  }

  Future<bool> callSignUpApi() async {
    await getUserToken();
    EasyLoading.show(status: 'Please Wait...');
    SignUpRequest signUpRequest = SignUpRequest(
        name: nameController.text,
        password: passwordController.text,
        fcmToken: getFcmToken,
        email: emailController.text);
    final response = await signUpApi(signUpRequest);
    if (response != null) {
      setSignUpResponse(response);
      if (_signUpResponse!.signUpData!.createUser!.userDataResponse != null) {
        setUserDataResponse(
            _signUpResponse!.signUpData!.createUser!.userDataResponse!);
        sharedPref.save('userData',
            _signUpResponse!.signUpData!.createUser!.userDataResponse!);
      }
      return _signUpResponse!.signUpData!.createUser!.status!;
    } else {
      return false;
    }
  }

  callUserName() async {
    if (_guestUser == false) {
      final username = _userDataResponse!.name!;
      setUserName(username);
    } else {
      setUserName('Guest User');
    }
  }

  Future<bool> signInWithGoogle() async {
    EasyLoading.show(status: 'Please Wait...');
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userDetails =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userDetails.user != null) {
        await getUserToken();
        final loginStatus = await callSocialMediaLoginApi(
            socialEmail: userDetails.user!.email!,
            socialProviderId: userDetails.user!.uid,
            socialRegistrationType: 'google',
            socialName: userDetails.user!.displayName!);
        return loginStatus;
      } else {
        EasyLoading.showError('Something Went Wrong');
        return false;
      }
    } else {
      EasyLoading.showError('Something Went Wrong');
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    EasyLoading.show(status: 'Please Wait...');

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      final userDetails = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      if (userDetails.user != null) {
        await getUserToken();
        final loginStatus = await callSocialMediaLoginApi(
            socialEmail: userDetails.user!.email!,
            socialProviderId: userDetails.user!.uid,
            socialRegistrationType: 'facebook',
            socialName: userDetails.user!.displayName!);
        return loginStatus;
      } else {
        EasyLoading.showError('Something Went Wrong');
        return false;
      }
    } else {
      EasyLoading.showError('Something Went Wrong');
      return false;
    }
  }

  Future<void> getUserToken() async {
    /*   if (Platform.isIOS) checkforIosPermission();*/
    await _firebaseMessaging.getToken().then((token) {
      setFcmToken(token!);
    });
  }

  Future<void> signOut() async {
    sharedPref.remove('userData');
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  Future<bool> callOtpVerification() async {
    EasyLoading.show(status: 'Please Wait...');
    OtpVerificationRequest otpVerificationRequest = OtpVerificationRequest(
      email: emailController.text,
      otp: otpController.text,
    );
    final response = await otpVerificationApi(
        otpVerificationRequest: otpVerificationRequest);
    if (response != null) {
      setOtpVerificationResponse(response);
      if (getOtpVerificationResponse.data!.verifyOtp!.data != null) {
        setUserDataResponse(getOtpVerificationResponse.data!.verifyOtp!.data!);
        sharedPref.save(
            'userData', getOtpVerificationResponse.data!.verifyOtp!.data);
      }
      return getOtpVerificationResponse.data!.verifyOtp!.status!;
    } else {
      return false;
    }
  }

  Future<bool> callResendOtp() async {
    EasyLoading.show(status: 'Sending Otp to your Email');
    ResendOtpRequest resendOtpRequest =
        ResendOtpRequest(email: emailController.text);
    final response = await resendOtpApi(resendOtpRequest: resendOtpRequest);
    if (response != null) {
      setResendOtpResponse(response);
      return getResendOtpResponse.data!.resendOtp!.status!;
    } else {
      return false;
    }
  }

  Future<bool> callForgetPasswordEmail() async {
    EasyLoading.show(status: 'Sending Otp to your Email');
    ForgetPasswordEmailRequest forgetPasswordEmailRequest =
        ForgetPasswordEmailRequest(email: emailController.text);
    final response = await forgetPasswordEmailApi(
        forgetPasswordEmailRequest: forgetPasswordEmailRequest);
    if (response != null) {
      setForgetPasswordEmailResponse(response);
      return getForgetPasswordEmailResponse.data!.forgotPassword!.status!;
    } else {
      return false;
    }
  }

  Future<bool> callResetPassword() async {
    EasyLoading.show(status: 'Please Wait...');
    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest(
        email: emailController.text, newPassword: passwordController.text);
    final response =
        await resetPasswordApi(resetPasswordRequest: resetPasswordRequest);
    if (response != null) {
      setResetPasswordResponse(response);
      return getResetPasswordResponse.data!.resetPassword!.status!;
    } else {
      return false;
    }
  }
/* void checkforIosPermission() async{
    await _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    await _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
*/
}

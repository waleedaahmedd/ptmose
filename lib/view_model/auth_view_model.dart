import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ptmose/models/responses/auth_response/login_response.dart';
import 'package:ptmose/models/responses/auth_response/social_media_login_response.dart';
import 'package:ptmose/models/responses/auth_response/user_data_response.dart';

import '../Service/api_service.dart';
import '../models/requests/auth_request/login_request.dart';
import '../models/requests/auth_request/sign_up_request.dart';
import '../models/requests/auth_request/social_media_login_request.dart';
import '../models/responses/auth_response/sign_up_response.dart';
import '../utils/shared_pref .dart';

class AuthViewModel with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String _emailValidateMessage = '';
  String _passwordValidateMessage = '';
  String _nameValidateMessage = '';
  String _confirmPasswordValidateMessage = '';
  String _fcmToken = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  LoginResponse? _loginResponse;
  SignUpResponse? _signUpResponse;
  SocialMediaLoginResponse? _socialMediaLoginResponse;

  UserDataResponse? _userDataResponse;
  SharedPref sharedPref = SharedPref();
  String? _userName;
  bool _guestUser = false;

  String get getFcmToken => _fcmToken;

  String get getEmailValidateMessage => _emailValidateMessage;

  String get getPasswordValidateMessage => _passwordValidateMessage;

  String get getNameValidateMessage => _nameValidateMessage;

  String get getConfirmPasswordValidateMessage =>
      _confirmPasswordValidateMessage;

  String get getUserName => _userName!;

  bool get getGuestUser => _guestUser;

  bool _showPassword = false;

  bool get getShowPassword => _showPassword;

  LoginResponse get getLoginResponse => _loginResponse!;

  SignUpResponse get getSignUpResponse => _signUpResponse!;

  SocialMediaLoginResponse get getSocialMediaLoginResponse =>
      _socialMediaLoginResponse!;

  UserDataResponse get getUserDataResponse => _userDataResponse!;

  void setFcmToken(String value) {
    _fcmToken = value;
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

  void setNameValidateMessage(String value) {
    _nameValidateMessage = value;
    notifyListeners();
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
    RegExp regex =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$");

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

  signUpValidation() {
    RegExp regex =
        RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$");

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

  Future<void> getUserToken() async {
    /*   if (Platform.isIOS) checkforIosPermission();*/
    await _firebaseMessaging.getToken().then((token) {
      setFcmToken(token!);
    });
  }

  Future<void> signOut() async {
    sharedPref.remove('userData');
    final FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
    await GoogleSignIn().signOut();
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

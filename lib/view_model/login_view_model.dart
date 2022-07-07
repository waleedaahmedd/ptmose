import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ptmose/models/responses/login_response.dart';

import '../Service/api_service.dart';
import '../models/requests/login_request.dart';
import '../models/requests/post.dart';
import '../utils/CRUD_data_locally.dart';

class LoginViewModel with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginResponse? _loginResponse;

  bool _showPassword = false;

  bool get getShowPassword => _showPassword;

  LoginResponse get getLoginResponse => _loginResponse!;

  void setShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  void setLoginResponse(LoginResponse value) {
    _loginResponse = value;
    notifyListeners();
  }

  PostModel post = PostModel();
  bool loading = false;

  /*getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    CRUDDataLocally.saveTokenLocally('',post.id);
    loading = false;

    notifyListeners();
  }*/

  Future<bool> callLoginApi(BuildContext context) async {
    EasyLoading.show(status: 'Please Wait...');
    LoginRequest loginRequest =
        LoginRequest(nameController.text, passwordController.text);
    loading = true;
    final response = await callGraphApi(loginRequest);
    if (response != null) {
      setLoginResponse(response);
      /*if (_loginResponse!.data!.loginUser!.status == true) {
        *//*Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));*//*
      } else {
        print(_loginResponse!.data!.loginUser!.message);
      }*/
      return _loginResponse!.data!.loginUser!.status!;
    } else {
      return false;
      //print(response);
    }
    response != null ? setLoginResponse(response) : loading = false;
  }

/*  getPostData(context) async {
    loading = true;
    final response  = await callGraphApi();
    CRUDDataLocally.saveTokenLocally('',post.id);
    loading = false;

    notifyListeners();
  }*/

}

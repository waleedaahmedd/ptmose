import 'package:ptmose/models/responses/auth_response/user_data_response.dart';

class LoginResponse {
  LoginData? loginData;

  LoginResponse({this.loginData});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    loginData = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (loginData != null) {
      data['data'] = loginData!.toJson();
    }
    return data;
  }
}

class LoginData {
  LoginUser? loginUser;

  LoginData({this.loginUser});

  LoginData.fromJson(Map<String, dynamic> json) {
    loginUser = json['loginUser'] != null
        ? LoginUser.fromJson(json['loginUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginUser != null) {
      data['loginUser'] = this.loginUser!.toJson();
    }
    return data;
  }
}

class LoginUser {
  UserDataResponse? userDataResponse;
  String? message;
  bool? status;

  LoginUser({this.userDataResponse, this.message, this.status});

  LoginUser.fromJson(Map<String, dynamic> json) {
    userDataResponse = json['data'] != null ? UserDataResponse.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDataResponse != null) {
      data['data'] = this.userDataResponse!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}



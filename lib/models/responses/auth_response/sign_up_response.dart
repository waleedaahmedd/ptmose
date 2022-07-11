import 'package:ptmose/models/responses/auth_response/user_data_response.dart';

class SignUpResponse {
  SignUpData? signUpData;

  SignUpResponse({this.signUpData});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    signUpData = json['data'] != null ? SignUpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.signUpData != null) {
      data['data'] = this.signUpData!.toJson();
    }
    return data;
  }
}

class SignUpData {
  CreateUser? createUser;

  SignUpData({this.createUser});

  SignUpData.fromJson(Map<String, dynamic> json) {
    createUser = json['createUser'] != null
        ? CreateUser.fromJson(json['createUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createUser != null) {
      data['createUser'] = createUser!.toJson();
    }
    return data;
  }
}

class CreateUser {
  bool? status;
  String? message;
  UserDataResponse? userDataResponse;

  CreateUser({this.status, this.message, this.userDataResponse});

  CreateUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDataResponse = json['data'] != null ? UserDataResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.userDataResponse != null) {
      data['data'] = this.userDataResponse!.toJson();
    }
    return data;
  }
}


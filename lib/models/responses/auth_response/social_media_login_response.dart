import 'package:ptmose/models/responses/auth_response/user_data_response.dart';

class SocialMediaLoginResponse {
  SocialMediaLoginResponseData? data;

  SocialMediaLoginResponse({this.data});

  SocialMediaLoginResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? SocialMediaLoginResponseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SocialMediaLoginResponseData {
  SocialMediaLogin? socialMediaLogin;

  SocialMediaLoginResponseData({this.socialMediaLogin});

  SocialMediaLoginResponseData.fromJson(Map<String, dynamic> json) {
    socialMediaLogin = json['socialMediaLogin'] != null
        ? SocialMediaLogin.fromJson(json['socialMediaLogin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (socialMediaLogin != null) {
      data['socialMediaLogin'] = socialMediaLogin!.toJson();
    }
    return data;
  }
}

class SocialMediaLogin {
  bool? status;
  String? message;
  UserDataResponse? data;

  SocialMediaLogin({this.status, this.message, this.data});

  SocialMediaLogin.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? UserDataResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

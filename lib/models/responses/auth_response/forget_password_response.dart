class ForgetPasswordResponse {
  ForgetPasswordResponseData? data;

  ForgetPasswordResponse({this.data});

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ForgetPasswordResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ForgetPasswordResponseData {
  ForgotPassword? forgotPassword;

  ForgetPasswordResponseData({this.forgotPassword});

  ForgetPasswordResponseData.fromJson(Map<String, dynamic> json) {
    forgotPassword = json['forgotPassword'] != null
        ? ForgotPassword.fromJson(json['forgotPassword'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forgotPassword != null) {
      data['forgotPassword'] = forgotPassword!.toJson();
    }
    return data;
  }
}

class ForgotPassword {
  bool? status;
  String? message;

  ForgotPassword({this.status, this.message});

  ForgotPassword.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
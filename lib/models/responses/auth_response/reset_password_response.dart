class ResetPasswordResponse {
  ResetPasswordResponseData? data;

  ResetPasswordResponse({this.data});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? ResetPasswordResponseData.fromJson(json['data'])
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

class ResetPasswordResponseData {
  ResetPassword? resetPassword;

  ResetPasswordResponseData({this.resetPassword});

  ResetPasswordResponseData.fromJson(Map<String, dynamic> json) {
    resetPassword = json['resetPassword'] != null
        ? ResetPassword.fromJson(json['resetPassword'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resetPassword != null) {
      data['resetPassword'] = resetPassword!.toJson();
    }
    return data;
  }
}

class ResetPassword {
  bool? status;
  String? message;

  ResetPassword({this.status, this.message});

  ResetPassword.fromJson(Map<String, dynamic> json) {
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

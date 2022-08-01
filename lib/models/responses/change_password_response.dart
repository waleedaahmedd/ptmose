class ChangePasswordResponse {
  ChangePasswordResponseData? data;

  ChangePasswordResponse({this.data});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ChangePasswordResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChangePasswordResponseData {
  ChangePassword? changePassword;

  ChangePasswordResponseData({this.changePassword});

  ChangePasswordResponseData.fromJson(Map<String, dynamic> json) {
    changePassword = json['changePassword'] != null
        ? ChangePassword.fromJson(json['changePassword'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (changePassword != null) {
      data['changePassword'] = changePassword!.toJson();
    }
    return data;
  }
}

class ChangePassword {
  bool? status;
  String? message;

  ChangePassword({this.status, this.message});

  ChangePassword.fromJson(Map<String, dynamic> json) {
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
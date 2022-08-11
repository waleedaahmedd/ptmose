import 'package:ptmose/models/responses/auth_response/user_data_response.dart';

class OtpVerificationResponse {
  OtpVerificationResponseData? data;

  OtpVerificationResponse({this.data});

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? OtpVerificationResponseData.fromJson(json['data'])
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

class OtpVerificationResponseData {
  VerifyOtp? verifyOtp;

  OtpVerificationResponseData({this.verifyOtp});

  OtpVerificationResponseData.fromJson(Map<String, dynamic> json) {
    verifyOtp = json['verifyOtp'] != null
        ? VerifyOtp.fromJson(json['verifyOtp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (verifyOtp != null) {
      data['verifyOtp'] = verifyOtp!.toJson();
    }
    return data;
  }
}

class VerifyOtp {
  bool? status;
  String? message;
  UserDataResponse? data;

  VerifyOtp({this.status, this.message, this.data});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
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

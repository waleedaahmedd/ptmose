class ResendOtpResponse {
  ResendOtpResponseData? data;

  ResendOtpResponse({this.data});

  ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ResendOtpResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ResendOtpResponseData {
  ResendOtp? resendOtp;

  ResendOtpResponseData({this.resendOtp});

  ResendOtpResponseData.fromJson(Map<String, dynamic> json) {
    resendOtp = json['resendOtp'] != null
        ? ResendOtp.fromJson(json['resendOtp'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resendOtp != null) {
      data['resendOtp'] = resendOtp!.toJson();
    }
    return data;
  }
}

class ResendOtp {
  bool? status;
  String? message;

  ResendOtp({this.status, this.message});

  ResendOtp.fromJson(Map<String, dynamic> json) {
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
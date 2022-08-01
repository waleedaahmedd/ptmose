class ChangeNameResponse {
  ChangeNameResponseData? data;

  ChangeNameResponse({this.data});

  ChangeNameResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ChangeNameResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChangeNameResponseData {
  UpdateProfile? updateProfile;

  ChangeNameResponseData({this.updateProfile});

  ChangeNameResponseData.fromJson(Map<String, dynamic> json) {
    updateProfile = json['updateProfile'] != null
        ? UpdateProfile.fromJson(json['updateProfile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (updateProfile != null) {
      data['updateProfile'] = updateProfile!.toJson();
    }
    return data;
  }
}

class UpdateProfile {
  bool? status;
  String? message;

  UpdateProfile({this.status, this.message});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
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
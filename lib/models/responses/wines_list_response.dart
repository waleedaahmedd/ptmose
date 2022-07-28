import 'package:ptmose/models/responses/wines_response.dart';

class WinesListResponse {
  WinesListResponseData? data;

  WinesListResponse({this.data});

  WinesListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? WinesListResponseData.fromJson(json['data'])
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

class WinesListResponseData {
  GetAllWines? getAllWines;

  WinesListResponseData({this.getAllWines});

  WinesListResponseData.fromJson(Map<String, dynamic> json) {
    getAllWines = json['getAllWines'] != null
        ? GetAllWines.fromJson(json['getAllWines'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllWines != null) {
      data['getAllWines'] = getAllWines!.toJson();
    }
    return data;
  }
}

class GetAllWines {
  bool? status;
  String? message;
  List<Wine>? data;

  GetAllWines({this.status, this.message, this.data});

  GetAllWines.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Wine>[];
      json['data'].forEach((v) {
        data!.add(Wine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

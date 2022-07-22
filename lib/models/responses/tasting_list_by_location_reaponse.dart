import 'package:ptmose/models/responses/tastings_response.dart';

class TastingListByLocationResponse {
  TastingListByLocationResponseData? data;

  TastingListByLocationResponse({this.data});

  TastingListByLocationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TastingListByLocationResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TastingListByLocationResponseData {
  GetAllTastings? getAllTastings;

  TastingListByLocationResponseData({this.getAllTastings});

  TastingListByLocationResponseData.fromJson(Map<String, dynamic> json) {
    getAllTastings = json['getAllTastings'] != null
        ? GetAllTastings.fromJson(json['getAllTastings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllTastings != null) {
      data['getAllTastings'] = getAllTastings!.toJson();
    }
    return data;
  }
}

class GetAllTastings {
  bool? status;
  String? message;
  List<Tastings>? data;

  GetAllTastings({this.status, this.message, this.data});

  GetAllTastings.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Tastings>[];
      json['data'].forEach((v) {
        data!.add(Tastings.fromJson(v));
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


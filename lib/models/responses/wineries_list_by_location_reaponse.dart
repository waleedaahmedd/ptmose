import 'package:ptmose/models/responses/wineries_response.dart';

class WineriesListByLocationResponse {
  WineriesListByLocationData? data;

  WineriesListByLocationResponse({this.data});

  WineriesListByLocationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? WineriesListByLocationData.fromJson(json['data'])
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

class WineriesListByLocationData {
  GetAllWineries? getAllWineries;

  WineriesListByLocationData({this.getAllWineries});

  WineriesListByLocationData.fromJson(Map<String, dynamic> json) {
    getAllWineries = json['getAllWineries'] != null
        ? GetAllWineries.fromJson(json['getAllWineries'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getAllWineries != null) {
      data['getAllWineries'] = getAllWineries!.toJson();
    }
    return data;
  }
}

class GetAllWineries {
  bool? status;
  String? message;
  List<Wineries>? data;

  GetAllWineries({this.status, this.message, this.data});

  GetAllWineries.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Wineries>[];
      json['data'].forEach((v) {
        data!.add(Wineries.fromJson(v));
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

import 'package:ptmose/models/responses/tastings_response.dart';

import '../../utils/date_time_formatter.dart';
import 'wines_response.dart';

class WineriesDetailsResponse {
  WineryDetailById? data;

  WineriesDetailsResponse({this.data});

  WineriesDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? WineryDetailById.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WineryDetailById {
  GetWineryById? getWineryById;

  WineryDetailById({this.getWineryById});

  WineryDetailById.fromJson(Map<String, dynamic> json) {
    getWineryById = json['getWineryById'] != null
        ? GetWineryById.fromJson(json['getWineryById'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getWineryById != null) {
      data['getWineryById'] = getWineryById!.toJson();
    }
    return data;
  }
}

class GetWineryById {
  bool? status;
  String? message;
  WineryDetailData? data;

  GetWineryById({this.status, this.message, this.data});

  GetWineryById.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? WineryDetailData.fromJson(json['data']) : null;
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

class WineryDetailData {
  String? wineryName;
  String? wineryAbout;
  String? wineryImage;
  String? startTime;
  String? endTime;
  String? address;
  List<Tastings>? tasting;
  List<Wine>? wine;

  WineryDetailData(
      {this.wineryName,
        this.wineryAbout,
        this.wineryImage,
        this.startTime,
        this.endTime,
        this.address,
        this.tasting,
        this.wine});

  WineryDetailData.fromJson(Map<String, dynamic> json) {
    wineryName = json['wineryName'];
    wineryAbout = json['wineryAbout'];
    wineryImage = json['wineryImage'];
    startTime = DateTimeFormatter.showTime(json['startTime']);
    endTime = DateTimeFormatter.showTime(json['endTime']);
    address = json['address'];
    if (json['Tasting'] != null) {
      tasting = <Tastings>[];
      json['Tasting'].forEach((v) {
        tasting!.add(Tastings.fromJson(v));
      });
    }
    if (json['Wine'] != null) {
      wine = <Wine>[];
      json['Wine'].forEach((v) {
        wine!.add(Wine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wineryName'] = wineryName;
    data['wineryAbout'] = wineryAbout;
    data['wineryImage'] = wineryImage;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['address'] = address;
    if (tasting != null) {
      data['Tasting'] = tasting!.map((v) => v.toJson()).toList();
    }
    if (wine != null) {
      data['Wine'] = wine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



import 'package:ptmose/models/responses/tastings_response.dart';
import 'package:ptmose/models/responses/wineries_response.dart';

class WineriesAndTestingResponse {
  WineriesAndTestingData? data;

  WineriesAndTestingResponse({this.data});

  WineriesAndTestingResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? WineriesAndTestingData.fromJson(json['data'])
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

class WineriesAndTestingData {
  GetWineryByLocation? getWineryByLocation;

  WineriesAndTestingData({this.getWineryByLocation});

  WineriesAndTestingData.fromJson(Map<String, dynamic> json) {
    getWineryByLocation = json['getWineryByLocation'] != null
        ? GetWineryByLocation.fromJson(json['getWineryByLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getWineryByLocation != null) {
      data['getWineryByLocation'] = getWineryByLocation!.toJson();
    }
    return data;
  }
}

class GetWineryByLocation {
  bool? status;
  String? message;
  WineryByLocationData? data;

  GetWineryByLocation({this.status, this.message, this.data});

  GetWineryByLocation.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? WineryByLocationData.fromJson(json['data'])
        : null;
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

class WineryByLocationData {
  List<Tastings>? tastings;
  List<Wineries>? wineries;

  WineryByLocationData({this.tastings, this.wineries});

  WineryByLocationData.fromJson(Map<String, dynamic> json) {
    if (json['tastings'] != null) {
      tastings = <Tastings>[];
      json['tastings'].forEach((v) {
        tastings!.add(Tastings.fromJson(v));
      });
    }
    if (json['wineries'] != null) {
      wineries = <Wineries>[];
      json['wineries'].forEach((v) {
        wineries!.add(Wineries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tastings != null) {
      data['tastings'] = tastings!.map((v) => v.toJson()).toList();
    }
    if (wineries != null) {
      data['wineries'] = wineries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
